import os
import subprocess
from pathlib import Path

# Default directory
default_directory = '/hyperactive/Mastering AI Agents for Databases'

# Function to convert mkv files to mp4
def process_videos(video_course_directory=default_directory):
    # Get list of all .mkv files in the directory and its subdirectories
    video_files = sorted(Path(video_course_directory).rglob("*.mkv"))
    
    # Count the number of files
    file_count = len(video_files)
    print(f"{file_count} files to process...")

    for file_path in video_files:
        # Extract directory, base name, and output file path
        file_directory = file_path.parent
        base_name = file_path.stem
        pre_file = file_path
        post_file = file_directory / f"{base_name}.mp4"

        print(f"\nProcessing file: {pre_file}")

        # Command to run ffmpeg
        command = [
            "ffmpeg", "-i", str(pre_file), "-y",
            "-vcodec", "libx265", "-crf", "20",
            str(post_file)
        ]

        # Execute the ffmpeg command
        try:
            subprocess.run(command, check=True)
            print(f"Converted: {post_file}")
        except subprocess.CalledProcessError as e:
            print(f"Error processing {pre_file}: {e}")

    print("\nProcessing completed!")

# Main execution
if __name__ == "__main__":
    # Optionally, pass a custom directory path to process_videos
    # process_videos("/path/to/video/course")
    process_videos()
