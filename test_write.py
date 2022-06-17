import csv

headers = [
    'Channel',
    'Data Type',
    'Charge',
    'Err Abs'
]

with open('temp_data.csv', 'w', newline='') as file:
    writer = csv.DictWriter(file, headers)
    writer.writeheader()
    writer.writerow({
        'Channel': 'channel1',
        'Data Type': 'sodium',
        'Charge': 100,
        'Err Abs': 5
    })
    writer.writerow({
        'Channel': 'channel1',
        'Data Type': 'SPE',
        'Charge': 10,
        'Err Abs': 1
    })
    writer.writerow({
        'Channel': 'channel2',
        'Data Type': 'sodium',
        'Charge': 200,
        'Err Abs': 10
    })
    writer.writerow({
        'Channel': 'channel2',
        'Data Type': 'SPE',
        'Charge': 10,
        'Err Abs': 2
    })
