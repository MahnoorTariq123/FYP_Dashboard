"use client";

import React, { useState, useRef } from "react";
import { QrReader } from "react-qr-reader";
import styles from "@/app/ui/Visitor/visitor.module.css";

const WebcamPage = () => {
  const [data, setData] = useState("No result");
  const [isActive, setIsActive] = useState(true);
  const scanningRef = useRef(false); // Ref to prevent multiple scans at once

  const handleResult = async (result, error) => {
    if (result && !scanningRef.current) {
      scanningRef.current = true;
      const scannedData = result.text;
      setData(scannedData);

      try {
        const response = await fetch('/api/Visitor', {
          method: 'DELETE',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({ qrCodeValue: scannedData }),
        });

        if (response.ok) {
          const data = await response.json();
          console.log('Success:', data);
          // Optionally, you can clear the data state or handle other logic here
        } else {
          console.error('Failed to delete record');
        }
      } catch (error) {
        console.error('Error:', error);
      }

      // Delay before allowing another scan
      setTimeout(() => {
        scanningRef.current = false;
      }, 3000); // Adjust delay duration as needed (in milliseconds)
    }

    if (error) {
      console.error(error);
    }
  };

  return (
    <div className={styles.containerCam}>
      {isActive && (
        <QrReader
          onResult={handleResult}
          constraints={{ facingMode: "environment" }}
          style={{ width: "100%", height: "100%" }}
        />
      )}
      <p>{data}</p>
      <button onClick={() => setIsActive(false)}>Close</button>
    </div>
  );
}

export default WebcamPage;
