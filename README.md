# A HUGE AWK SED BASH Problem - System Commands Assignment

This script was created as part of an assignment for the System Commands course in the IITM BS Data Science program. The assignment presented a challenging task of data reconstruction and correction from OCR data files using a combination of Bash, AWK, and Sed scripts.

## Assignment Description

The assignment required students to tackle a complex data manipulation problem with the following objectives:

- Reconstruct the Shopping Bill dataset from OCR data files.
- Generate individual files for each card with cleaned and corrected data.
- Handle potential OCR errors and misread data.

## Features

- **Data Reconstruction:** The script extracts relevant information from OCR data files.
- **Data Correction:** It addresses issues related to misread characters, digits, or words in the OCR data.
- **Text Processing Tools:** Utilizes powerful text processing tools, including AWK, Sed, and Bash.
- **Modular Approach:** The solution is organized into separate scripts for clarity.

## Usage

To use this script:

1. Place all required OCR data files in the same directory as the scripts. These files include:
   - `ocr_categories.txt`
   - `ocr_head.txt`
   - `ocr_names.txt`
   - `ocr_cost.txt`
   - `ocr_item_record.txt`
   - `ocr_seqno.txt`
   - `ocr_full.txt`
   - `ocr_items.txt`
   - `ocr_shopname.txt`

2. Execute the main script in your terminal to reconstruct the shopping bills:
   ```bash
   ./reconstruct_shopping_bills.sh
   ```

3. The script generates separate shopping bill files (`shopping_bill_<card_number>.txt`) for each card.

## Output Format

The generated files follow this format:

```
SHOPNAME:CUSTOMER_NAME:CARD_NO
Item:Category:Qty:Price:Cost
Carrots:Vegetable/Food:1.5:50:75
...
...
```

- `SHOPNAME`: Extracted from the `ocr_shopname.txt` file.
- `CUSTOMER_NAME`: Retrieved from the `ocr_names.txt` file.
- `CARD_NO`: Extracted from the `ocr_seqno.txt` file.

## Prerequisites

- Bash shell environment.
- Text processing tools like AWK, Sed, and Grep available in your system.

## Notes

- The accuracy of the generated files depends on the quality of the OCR data and the correction logic implemented in the scripts.
- The scripts can handle misread characters, digits, or words in the OCR data.

## Assignment Details

- **Course:** System Commands
- **Program:** IITM BS Data Science
- **Institution:** [Indian Institute of Technology Madras](https://www.iitm.ac.in/)
- **Author:** Hanani Bathina
