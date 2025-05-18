# StreetSense: Navigating the World, Beyond Sight

# A project by Jay, Luis, Baasir, and Elijah

---

# Overview

StreetSense is a real-time AI-powered navigation tool designed to enhance urban mobility for the visually impaired. Developed at Hack Canada, this project aims to make navigating urban environments safer and more independent for those with visual challenges.

StreetSense leverages advanced AI technologies to detect crosswalks, vehicles, traffic signs, and other key objects, providing immediate and clear feedback to users.

---

## Features

 *Real-time Object Detection:* Identifies critical urban elements such as crosswalks, vehicles, and traffic signs.
 *Audio Feedback:* Provides clear and immediate information about the environment.
 *Portable and Efficient:* Optimized for on-device processing using TensorFlow Lite.

---

# Technology Stack

* *Backend:* Python and Flask for server-side logic.
* *Object Detection:* YOLOv3 for detecting urban objects.
* *Image Processing:* OpenCV to capture and process images.
* *Model Inference:* TensorFlow Lite for efficient, lightweight model deployment.

---

# How It Works

1. *Input Capture:* The camera captures real-time video.
2. *Object Detection:* YOLOv3 identifies objects of interest, including crosswalks and vehicles.
3. *Image Processing:* OpenCV processes the video feed to improve detection accuracy.
4. *Model Inference:* TensorFlow Lite enables on-device analysis for low-latency responses.
5. *User Feedback:* The system delivers audio guidance to assist navigation.

---
