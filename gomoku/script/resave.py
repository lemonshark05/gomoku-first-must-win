import os
import json

def create_folder(path):
    if not os.path.exists(path):
        os.makedirs(path)

def save_step(folder, file_name, data):
    with open(os.path.join(folder, file_name + '.json'), 'w') as f:
        json.dump(data, f)

def main():
    board_size = 15
    base_folder = './divided'

    for row in range(board_size):
        for col in range(board_size):
            # Generate folder name and file name
            folder_name = chr(97 + row)  # a, b, c, ...
            file_name = f'{folder_name}{col+1}'  # a1, a2, a3, ...
            full_folder_path = os.path.join(base_folder, folder_name)

            # Create folder
            create_folder(full_folder_path)

            # Save step in JSON format
            step_data = {'row': row, 'col': col}
            save_step(full_folder_path, file_name, step_data)

if __name__ == "__main__":
    main()
