# Claude Autowake

Inicia anticipadamente tu ventana de uso de 5 horas de Claude Code para que se reinicie antes de que la necesites.

## Cómo Funciona

El límite de uso de Claude Code opera en una ventana móvil de 5 horas. Esta herramienta envía un único mensaje pequeño a Haiku en horarios programados (con >= 5h de diferencia) para iniciar cada ventana. Para las 9 am, ya habrás transcurrido 3 horas de la primera ventana, lo que significa que se reiniciará a las 11 am en lugar de las 2 pm.

Cada ping es un mensaje (`"hi"`) al modelo más económico (Haiku), con un costo mínimo de tokens.

## Inicio Rápido

```bash
# 1. Edita config.sh para establecer tu horario preferido
vim config.sh

# 2. Instala (configura launchd + pmset wake schedule)
./install.sh

# 3. Pruébalo manualmente
./autowake.sh

# 4. Verifica el estado
./status.sh
```

## Configuración

Edita `config.sh` para personalizar:

| Ajuste | Predeterminado | Descripción |
|---------|---------|-------------|
| `PING_TIMES` | `("06:00")` | Array de horas de ping en formato HH:MM 24h. Deben estar separadas por >= 5h. |
| `WAKE_LEAD_MINUTES` | `3` | Minutos antes del primer ping para despertar el Mac del modo reposo |
| `WEEKDAYS_ONLY` | `false` | Omitir fines de semana cuando es `true` |
| `CLAUDE_MODEL` | `"haiku"` | Modelo al que hacer ping (haiku = el más barato) |
| `PING_PROMPT` | `"hi"` | Qué enviar (mantenlo muy corto) |
| `CAFFEINATE_SECONDS` | `"auto"` | `"auto"` = lapso de las horas de ping + 10 min de margen. O establece un número de segundos manualmente. |
| `PING_WORKING_DIR` | `""` | Directorio al que entrar (cd) antes de ejecutar claude (directorio temporal si está vacío) |
| `CLAUDE_EXTRA_FLAGS` | `""` | Flags adicionales para la CLI de claude (ej. `"--dangerouslySkipPermissions"`) |
| `MAX_LOG_FILES` | `30` | Máximo de archivos de log a conservar |

### Ejemplos de Horarios

Con pings cada 5 horas:

| `PING_TIMES` | La ventana se reinicia aprox. a las |
|---|---|
| `("05:00" "10:00" "15:00")` | ~10am, ~3pm, ~8pm |
| `("06:00" "11:00" "16:00")` | ~11am, ~4pm, ~9pm |
| `("06:00")` | ~11am |

## Requisitos

- macOS (utiliza launchd, pmset, caffeinate)
- [Claude Code CLI](https://docs.anthropic.com/en/docs/claude-code) instalado y autenticado
- Mac conectado a la corriente (requerido para que pmset lo despierte del reposo)

## Logs

Almacenados en `~/.claude-autowake/logs/`. Se depuran automáticamente manteniendo los últimos 30 archivos.

```bash
# Ver el log más reciente
ls -t ~/.claude-autowake/logs/ping_*.log | head -1 | xargs cat

# Verificar estado de launchd
launchctl list | grep autowake

# Verificar horario de encendido (wake schedule)
pmset -g sched
```

## Desinstalación

```bash
./uninstall.sh
```


## Extra
# Verifica el uso total y comprueba si el modelo haiku está enviando correctamente.
```bash
npx ccusage@latest
```
