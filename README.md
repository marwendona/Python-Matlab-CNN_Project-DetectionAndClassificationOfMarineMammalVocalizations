# Detection And Classification Of Marine Mammal Vocalizations

This repository contains an application for the detection and classification of marine mammal vocalizations. The goal of this project is to accurately identify and categorize the vocalizations of dolphins. The application utilizes Convolutional Neural Networks (CNN) and incorporates both natural and anthropogenic noises with varying Signal-to-Noise Ratios (SNRs) ranging from 0 dB to 30 dB.

## Dataset

The dataset used in this project consists of 5 classes of dolphin vocalizations. In order to train the CNN, a MATLAB algorithm was developed to generate 50,000 spectrograms. Out of these, 30,000 spectrograms were used for training, and the remaining 20,000 were used for testing.

## Results

The trained CNN achieved an accuracy of 87.6% with a margin of error of 19.5%. These results indicate the effectiveness of the developed algorithm in accurately detecting and classifying dolphin vocalizations.

## Repository Structure

The repository is organized as follows:

- `Python-CNN_Model`: This directory contains the Jupyter Notebook with the implementation of the CNN for the detection and classification of dolphin vocalizations.
- `Matlab-DatabaseConstruction`: This directory contains the MATLAB algorithm used to generate the spectrograms for training and testing.

## Usage

To use the application, follow these steps:

1. Clone the repository to your local machine.
2. Open the `Python-CNN_Model` directory and run the Jupyter Notebook to train the CNN and evaluate its performance.
3. Use the MATLAB algorithm in the `Matlab-DatabaseConstruction` directory to generate spectrograms for testing or further analysis.

## Requirements

To run the application, you need the following dependencies:

- Python 3.x
- Jupyter Notebook
- MATLAB

Make sure you have these dependencies installed before running the code.

## Contributing

If you'd like to contribute to this project, please follow these guidelines:

1. Fork the repository.
2. Create a new branch for your contribution.
3. Make your changes and commit them with descriptive messages.
4. Push your changes to your forked repository.
5. Submit a pull request explaining the changes you've made.
