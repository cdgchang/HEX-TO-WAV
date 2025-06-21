% Select the TXT file
[filename, filepath] = uigetfile('*.txt', 'Select a TXT file');
inputTxt = fullfile(filepath, filename);

% Set parameters
bitdepth = input('Enter bit depth: ');
samplerate = input('Enter sample rate: ');

% Read the first line of the text file
fileID = fopen(inputTxt, 'r');
first_line = fgetl(fileID);
fclose(fileID);

% Determine the number of characters per sample based on bitdepth
expected_chars_per_sample = bitdepth / 4;

% Read the text file
raw_data = fileread(inputTxt);

% Convert text data to numbers
decimal_values = hex2dec(regexp(raw_data, ['\w{' num2str(expected_chars_per_sample) '}'], 'match'));

% Check if the actual number of characters per sample matches the expected value
actual_chars_per_sample = numel(regexp(first_line, '\w', 'match'));
if actual_chars_per_sample ~= expected_chars_per_sample
    warning('Bit depth setting may be incorrect. Check if the number of characters per sample matches bitdepth/4.');
    % Display the number of characters per line in the TXT file
    disp(['Number of characters per line in ' filename ': ' num2str(numel(first_line))]);
    return;  % Exit the program
end

% Handle signed bitdepth PCM encoding
decimal_values(decimal_values >= 2^(bitdepth - 1)) = decimal_values(decimal_values >= 2^(bitdepth - 1)) - 2^bitdepth;

% Normalize data to the range [-1, 1]
normalized_values = decimal_values / (2^(bitdepth - 1));

% Save PCM data as a WAV file
outputWav = fullfile(filepath, [filename(1:end-4) '_output.wav']);
audiowrite(outputWav, normalized_values, samplerate, 'BitsPerSample', bitdepth);

disp(['Completed: ' outputWav]);



