import clean_enoa as ce
import json

last_year_pea = round((ce.get_trimester_pea(4) / 1_000_000), 1)
first_trimester_pea = round((ce.get_trimester_pea(0) / 1_000_000), 1)
to_render = {"last_year_pea" : last_year_pea, "first_trimester_pea" : first_trimester_pea}

with open('docs/data.json', 'w') as f:
    json.dump(to_render, f)