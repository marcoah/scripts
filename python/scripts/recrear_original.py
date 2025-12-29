import json

# Ruta del archivo
input_path = "original.json"
output_path = "modificado.json"

# Cargar el JSON desde el archivo
with open(input_path, "r", encoding="utf-8") as file:
    data = json.load(file)

# Modificar la estructura: cada clave debe tener el mismo valor que su nombre
modified_data = {key: key for key in data.keys()}

# Guardar el JSON modificado en un nuevo archivo
with open(output_path, "w", encoding="utf-8") as file:
    json.dump(modified_data, file, indent=4, ensure_ascii=False)

print(f"Archivo modificado guardado en {output_path}")
