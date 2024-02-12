import csv
from datetime import datetime
from functools import partial

def read_csv(file_path):
    with open(file_path, newline='', encoding='utf-8') as csvfile:
        return list(csv.DictReader(csvfile))

def filter_by_date_range(start_date, end_date, program):
    return start_date <= program['放映開始日'] <= end_date and program['放映開始日'] != '\\N'

def get_unique_song_info(anison_data):
    unique_song_info = {}
    for entry in anison_data:
        unique_song_info.setdefault(entry['番組ID'], set()).add((entry['楽曲名'], entry['歌手名']))
    return unique_song_info

def display_program_info(unique_song_info, program):
    program_id, program_name = program['番組ID'], program['番組名']
    print(f"番組ID: {program_id}, 番組名: {program_name}")
    song_info = unique_song_info.get(program_id, [])
    for song_name, artist_name in song_info:
        print(f" - 楽曲名: {song_name}, 歌手名: {artist_name}")
    if not song_info:
        print(" (楽曲情報なし)")
    return len(song_info)

def main():
    program_data = read_csv('program.csv')
    anison_data = read_csv('anison.csv')

    start_date = input("放送開始日の開始日（YYYY-MM-DD）を入力してください: ")
    end_date = input("放送開始日の終了日（YYYY-MM-DD）を入力してください（空白の場合は現在）: ")

    end_date = end_date or datetime.now().strftime('%Y-%m-%d')

    filter_programs = partial(filter_by_date_range, start_date, end_date)
    filtered_programs = filter(filter_programs, program_data)
    unique_song_info = get_unique_song_info(anison_data)

    total_song_count = 0
    display_program_info_partial = partial(display_program_info, unique_song_info)
    for program in filtered_programs:
        total_song_count += display_program_info_partial(program)
    
    print(f"総楽曲数: {total_song_count}")

if __name__ == "__main__":
    main()
