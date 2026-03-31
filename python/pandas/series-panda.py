"""
series_financiero.py
Exploración avanzada de pandas Series con datos de precios de acciones.
Cubre: indexado/slicing, estadísticas, NaN, operaciones entre Series.
"""

import pandas as pd
import numpy as np

SEP = lambda titulo: print(f"\n{'═'*60}\n  {titulo}\n{'═'*60}")

# ════════════════════════════════════════════════════════════
# 1. CREACIÓN DE SERIES
# ════════════════════════════════════════════════════════════
SEP("1. CREACIÓN DE SERIES")

fechas = pd.date_range(start="2024-01-02", periods=12, freq="W-FRI")  # 12 viernes

precios_aapl = pd.Series(
    [185.2, 186.5, 184.8, 188.3, 191.0, np.nan, 193.4, 190.2, 195.6, 197.8, np.nan, 200.1],
    index=fechas,
    name="AAPL"
)

precios_msft = pd.Series(
    [375.0, 378.2, 372.5, 380.1, 383.7, 385.0, np.nan, 390.4, 388.9, 395.2, 398.0, 401.3],
    index=fechas,
    name="MSFT"
)

print("── AAPL (con NaN):\n", precios_aapl)
print("\n── MSFT (con NaN):\n", precios_msft)


# ════════════════════════════════════════════════════════════
# 2. INDEXADO Y SLICING AVANZADO
# ════════════════════════════════════════════════════════════
SEP("2. INDEXADO Y SLICING AVANZADO")

# Por posición (iloc)
print("Primeros 3 precios (iloc[:3]):\n", precios_aapl.iloc[:3])

# Por etiqueta (loc) con fechas
print("\nMarzo 2024 (loc):\n", precios_aapl.loc["2024-03"])

# Rango de fechas
print("\nEnero - Febrero (loc rango):\n", precios_aapl.loc["2024-01-01":"2024-02-28"])

# Booleano: solo semanas donde AAPL superó 190
mask_alto = precios_aapl > 190
print("\nSemanas con AAPL > 190:\n", precios_aapl[mask_alto])

# Semanas donde AAPL bajó respecto a la semana anterior
baja = precios_aapl < precios_aapl.shift(1)
print("\nSemanas con cierre menor al anterior:\n", precios_aapl[baja])


# ════════════════════════════════════════════════════════════
# 3. MANEJO DE NaN / DATOS FALTANTES
# ════════════════════════════════════════════════════════════
SEP("3. MANEJO DE NaN / DATOS FALTANTES")

print("¿Hay NaN en AAPL?:", precios_aapl.isna().any())
print("Cantidad de NaN:", precios_aapl.isna().sum())
print("Índices con NaN:\n", precios_aapl[precios_aapl.isna()])

# Estrategia 1: rellenar con la media
aapl_fill_media = precios_aapl.fillna(precios_aapl.mean())
print("\nRelleno con media:\n", aapl_fill_media)

# Estrategia 2: interpolación lineal (más realista para precios)
aapl_interpolado = precios_aapl.interpolate(method="linear")
print("\nInterpolación lineal:\n", aapl_interpolado)

# Estrategia 3: forward fill (último precio conocido)
aapl_ffill = precios_aapl.ffill()
print("\nForward fill:\n", aapl_ffill)

# Trabajamos con la serie interpolada de acá en adelante
aapl = aapl_interpolado
msft = precios_msft.interpolate(method="linear")


# ════════════════════════════════════════════════════════════
# 4. OPERACIONES ESTADÍSTICAS
# ════════════════════════════════════════════════════════════
SEP("4. OPERACIONES ESTADÍSTICAS")

print("── Estadísticas descriptivas AAPL:\n", aapl.describe())

print(f"\nMedia:      {aapl.mean():.2f}")
print(f"Mediana:    {aapl.median():.2f}")
print(f"Desv. std:  {aapl.std():.2f}")
print(f"Varianza:   {aapl.var():.2f}")
print(f"Mínimo:     {aapl.min():.2f}  ({aapl.idxmin().date()})")
print(f"Máximo:     {aapl.max():.2f}  ({aapl.idxmax().date()})")

# Retorno diario porcentual
retorno_aapl = aapl.pct_change() * 100
print("\nRetorno semanal (%) AAPL:\n", retorno_aapl.round(2))

# Retorno acumulado
retorno_acum = (1 + aapl.pct_change()).cumprod() - 1
print("\nRetorno acumulado AAPL:\n", (retorno_acum * 100).round(2))

# Media móvil de 4 semanas
media_movil = aapl.rolling(window=4).mean()
print("\nMedia móvil 4 semanas AAPL:\n", media_movil.round(2))

# Volatilidad (desv. std rolling)
volatilidad = retorno_aapl.rolling(window=4).std()
print("\nVolatilidad 4 semanas AAPL (%):\n", volatilidad.round(3))


# ════════════════════════════════════════════════════════════
# 5. OPERACIONES ENTRE SERIES
# ════════════════════════════════════════════════════════════
SEP("5. OPERACIONES ENTRE SERIES")

# Diferencia de precios
spread = msft - aapl
print("Spread MSFT - AAPL:\n", spread.round(2))

# Ratio de precios
ratio = msft / aapl
print("\nRatio MSFT/AAPL:\n", ratio.round(4))

# Correlación
correlacion = aapl.corr(msft)
print(f"\nCorrelación AAPL ↔ MSFT: {correlacion:.4f}")

# Normalización base 100 (para comparar rendimiento relativo)
aapl_norm = (aapl / aapl.iloc[0]) * 100
msft_norm = (msft / msft.iloc[0]) * 100

comparacion = pd.DataFrame({"AAPL (base 100)": aapl_norm, "MSFT (base 100)": msft_norm})
print("\nRendimiento relativo (base 100):\n", comparacion.round(2))

# ¿Qué semanas AAPL le ganó a MSFT en rendimiento?
aapl_gana = aapl_norm > msft_norm
print("\nSemanas donde AAPL superó a MSFT (rendimiento base 100):")
print(comparacion[aapl_gana])


# ════════════════════════════════════════════════════════════
# 6. RESUMEN FINAL
# ════════════════════════════════════════════════════════════
SEP("6. RESUMEN COMPARATIVO")

resumen = pd.DataFrame({
    "Precio inicial": [aapl.iloc[0],  msft.iloc[0]],
    "Precio final":   [aapl.iloc[-1], msft.iloc[-1]],
    "Retorno total %":[((aapl.iloc[-1] / aapl.iloc[0]) - 1) * 100,
                       ((msft.iloc[-1] / msft.iloc[0]) - 1) * 100],
    "Volatilidad %":  [retorno_aapl.std(), (msft.pct_change()*100).std()],
    "Máximo":         [aapl.max(), msft.max()],
    "Mínimo":         [aapl.min(), msft.min()],
}, index=["AAPL", "MSFT"])

print(resumen.round(2))