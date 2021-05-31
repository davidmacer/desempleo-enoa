import jinja2
import clean_enoa as ce

templateLoader = jinja2.FileSystemLoader(searchpath="./src/")
templateEnv = jinja2.Environment(loader=templateLoader)
TEMPLATE_FILE = "template.html"
template = templateEnv.get_template(TEMPLATE_FILE)
to_render = {"last_year_pea" : ce.get_trimester_pea(4), "first_trimester_pea" : ce.get_trimester_pea(0)}
outputText = template.render(**to_render)

print(outputText)