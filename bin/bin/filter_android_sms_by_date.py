#!/usr/bin/env python
#
# Outputs the specified sms.xml file output by the SMSBackupAndRestore android
# app, with only the messages newer than a specified date.

import re
import sys


RX_TAG = re.compile('<([^\/].+)\ ')
RX_DATE = re.compile('date="(.*)"')
TURNING_DATE = 1498112075000 # 22 June 2017
OUTPUT_FILE_NAME = 'output.xml'


def append_line(output_file, line):
    output_file.write(line + '\n')


def extract(rx, line):
    groups = rx.match(line)
    return groups.group(1)


def extract_tag(line):
    return extract(RX_TAG, line)


def extract_date(line):
    return extract(RX_DATE, line)


def filter_xml(input_file_name, output_file_name, filter):
    with open(input_file_name, 'r') as input_file:
        with open(output_file_name, 'w') as output_file:
            entered_mms = False
            keep_mms = False
            for line in input_file:
                if entered_mms:
                    if keep_mms:
                        append_line(output_file, line)
                    if line.startswith('</mms'):
                        entered_mms = False
                        keep_mms = False
                else:
                    tag = extract_tag(line)
                    if tag == 'sms':
                        sms_date = extract_date(line)
                        if filter(sms_date):
                            append_line(output_file, line)
                    else if tag == 'mms':
                        entered_mms = True
                        mms_date = extract_date(line)
                        if filter(mms_date):
                            keep_mms = True
                            append_line(output_file, line)
                        else:
                            keep_mms = False
                    else:
                        append_line(output_file, line)


def filter(sms_date, turning_date):
    # TODO: flip the operator here
    return sms_date < turning_date


def create_filter(turning_date):
    return lambda sms_date: filter(sms_date, turning_date)


def main():
    file_name = sys.argv[1]
    date = sys.argv[2]
    filter_xml(file_name, OUTPUT_FILE_NAME, create_filter(TURNING_DATE))


if __name__ == '__main__':
    main()
