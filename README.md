# Tools-
# imagedecode_nnbit_xxk_mono_inputbox.m

## 🔍 Description

This MATLAB script converts hexadecimal PCM data stored in a `.txt` file into a playable `.wav` audio file.

It supports arbitrary **bit depths** and **sampling rates**, and assumes the input represents **mono (single-channel)** audio.

---

## 📥 Input Format

- **File type**: `.txt`
- **Content**: Continuous hexadecimal characters (e.g., `12AF34FF...`)
- **Each sample length**: `(bit depth / 4)` characters  
  - e.g., for 16-bit audio: 16 / 4 = **4 characters per sample**

---

## ▶️ How to Use

1. Run the script in MATLAB:

   ```matlab
   imagedecode_nnbit_xxk_mono_inputbox
A file dialog will open. Select a .txt file containing the hex data.

You will be prompted to enter:

Bit depth (e.g., 16)

Sample rate (e.g., 48000)

The script will:

Validate the character count per sample

Decode hex to signed PCM

Normalize the data to the range [-1, 1]

Save the result as a .wav file in the same folder, named:

php-template
Copy
Edit
<original_filename>_output.wav
📤 Output
Format: .wav

Channels: Mono

File name: Same as input + _output.wav

Bit depth and sample rate: As entered by the user

⚠️ Notes
The script checks that each sample has the expected number of characters. If not, a warning is shown and the process stops.

Input file must contain raw hex values only, with no whitespace or delimiters.

Very large files may require splitting or performance tuning.

📚 Example
If your input.txt contains:

Copy
Edit
12AF34FF00CDEEFF...
And you specify:

Bit depth: 16

Sample rate: 48000

You will get:

Copy
Edit
input_output.wav
🔧 Possible Extensions
Support for stereo (interleaved) input

Visual waveform plotting

Batch processing for multiple .txt files

📄 Version & Author
Version: 1.0

Author: Eric
