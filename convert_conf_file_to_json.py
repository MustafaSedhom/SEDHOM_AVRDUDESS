import re
import json

CONF_FILE  = r"C:\Program Files (x86)\AVRDUDESS\avrdude.conf"
OUTPUT_FILE  = r"C:\Users\elmoh\OneDrive\Desktop\SEDHOM_AVRDude_project\avrdata.json"

with open(CONF_FILE, "r", encoding="utf-8") as f:
    data = f.read()

print(f"Length of data read: {len(data)} characters")

# تقسيم كل part (MCU) في الملف
parts = re.split(r'\bpart\b', data)
print(f"Found {len(parts)-1} MCU parts in the conf file")

mcu_list = []

for idx, part in enumerate(parts[1:], start=1):  # أول جزء مش MCU
    mcu = {}

    # استخراج id
    id_match = re.search(r'id\s*=\s*"([^"]+)"', part)
    if id_match:
        mcu['id'] = id_match.group(1)

    # استخراج description
    name_match = re.search(r'desc\s*=\s*"([^"]+)"', part)
    if name_match:
        mcu['name'] = name_match.group(1)

    # استخراج signature
    sig_match = re.search(r'signature\s*=\s*([0-9a-fx\s]+)', part)
    if sig_match:
        mcu['signature'] = sig_match.group(1).strip()

    # استخراج flash memory
    flash_match = re.search(r'flash\s*=\s*(\d+)', part)
    if flash_match:
        mcu['flash'] = int(flash_match.group(1))

    # استخراج eeprom memory
    eeprom_match = re.search(r'eeprom\s*=\s*(\d+)', part)
    if eeprom_match:
        mcu['eeprom'] = int(eeprom_match.group(1))

    # استخراج fuses
    fuses = {}
    fuse_matches = re.findall(r'(\w+)_fuse\s*=\s*(0x[0-9a-fA-F]+)', part)
    for fuse_name, fuse_val in fuse_matches:
        fuses[fuse_name] = fuse_val
    if fuses:
        mcu['fuses'] = fuses

    # استخراج lock bits
    lock_match = re.search(r'lock\s*=\s*(0x[0-9a-fA-F]+)', part)
    if lock_match:
        mcu['lock'] = lock_match.group(1)

    # استخراج variants
    variants = re.findall(r'variant\s*=\s*"([^"]+)"', part)
    if variants:
        mcu['variants'] = variants

    # طباعة MCU للتأكد
    print(f"MCU {idx}: {mcu.get('id', 'N/A')} - {mcu.get('name', 'N/A')}")
    if 'variants' in mcu:
        print(f"  Variants: {mcu['variants']}")
    if 'fuses' in mcu:
        print(f"  Fuses: {mcu['fuses']}")
    if 'flash' in mcu:
        print(f"  Flash: {mcu['flash']} bytes")
    if 'eeprom' in mcu:
        print(f"  EEPROM: {mcu['eeprom']} bytes")
    if 'lock' in mcu:
        print(f"  Lock: {mcu['lock']}")

    mcu_list.append(mcu)

# حفظ كل المعلومات في JSON
with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
    json.dump({"mcu": mcu_list}, f, indent=2)

print(f"\nDone! {len(mcu_list)} MCUs exported to {OUTPUT_FILE}")
