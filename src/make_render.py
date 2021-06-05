import clean_enoa as ce
import json

last_year_pea = round((ce.get_trimester_pea(4) / 1_000_000), 1)
first_trimester_pea = round((ce.get_trimester_pea(0) / 1_000_000), 1)
first_trimester_employed_population = ce.get_trimester_employed_men(0) + ce.get_trimester_employed_women(0)
first_trimester_employed_population = round((first_trimester_employed_population / 1_000_000), 1)
last_year_employed_population = ce.get_trimester_employed_men(4) + ce.get_trimester_employed_women(4)
last_year_employed_population = round((last_year_employed_population / 1_000_000), 1)
to_render = {
    "last_year_pea": last_year_pea,
    "first_trimester_pea": first_trimester_pea,
    "last_year_employed_population": last_year_employed_population,
    "first_trimester_employed_population": first_trimester_employed_population,
}

with open("docs/data.json", "w") as f:
    json.dump(to_render, f)
