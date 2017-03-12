# Next line with & executes in a forked shell in the background. That's parallel and not recommended.
# Remove if causing problem
#for file in "$DL_PATH"*_64kb.mp3; do ffmpeg -i "$file" -ar 16000 -ac 1 "$DL_PATH""`basename "$file" _64kb.mp3`.wav" & done 
DL_PATH="kurt/"
for file in "$DL_PATH"*.mp3; do
	ffmpeg -i "$file" -ar 16000 -ac 1 "$DL_PATH""`basename "$file" .mp3`.wav"
done 
echo "Cleaning up"
rm "$DL_PATH"*.ogg

echo "Preprocessing"
python preprocess.py "$DL_PATH"
echo "Done!"

echo "Writing datasets"
python _2npy.py
echo "Done!"
