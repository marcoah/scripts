import json

# Ruta del archivo
input_path = "original.json"
output_path = "ordenado.json"

# Cargar el JSON desde el archivo
with open(input_path, "r", encoding="utf-8") as file:
    data = json.load(file)

# Ordenar el JSON por clave
sorted_data = dict(sorted(data.items()))

# Guardar el JSON ordenado en un nuevo archivo
with open(output_path, "w", encoding="utf-8") as file:
    json.dump(sorted_data, file, indent=4, ensure_ascii=False)

print(f"Archivo ordenado guardado en {output_path}")