# Bitácora de Analogías: SO ↔ Segundo Cerebro

**Documento vivo** — completa esto conforme uses el sistema. La idea es que expliques, con tus propias palabras después de usar cada pieza, cómo cada concepto de Sistemas Operativos se manifiesta en tu vault real.

---

## 1. Sistema de Archivos / Inodos

**Concepto SO:** El filesystem mantiene referencias entre archivos (inodos) usando números. Los wikilinks de Obsidian funcionan igual: `[[nota]]` es una referencia entre archivos.

**Cómo funciona en tu vault:**
- Cada nota es un "inodo" (archivo Markdown con metadatos)
- Los wikilinks `[[01-En-Proceso/tarea-urgente]]` son referencias entre pendientes
- Las carpetas (00-Bandeja, 01-En-Proceso, etc.) organizan los inodos por estado

**¿Cómo lo experimentas tú? Explica después de 1-2 semanas de uso:**
Después de dos semanas, los wikilinks sí me resultaron útiles, sobre todo en los días donde ya tenía varias actividades resueltas: en vez de recordar de memoria qué había avanzado en cada materia, podía abrir una nota y seguir el rastro de enlaces hacia lo que ya había hecho antes. Es la misma idea de un inodo apuntando a otro archivo: no necesito saber "dónde" físicamente está la información, solo seguir el puntero.

---

## 2. Gestión de Memoria (RAM vs Disco)

**Concepto SO:** RAM = memoria rápida para datos activos. Disco = almacenamiento lento pero permanente.

**Cómo funciona en tu vault:**
- `01-En-Proceso/` = "RAM" del sistema — tareas/ideas que estás **procesando ahora**
- `03-Completado-Archivo/` = "disco" — historial de todo lo que ya cerraste

**¿Cómo lo experimentas tú?**
En la práctica, mi "RAM" (01-En-Proceso) sí se llena más rápido de lo que se vacía: en dos semanas llegué a tener 9 tareas activas a la vez frente a solo 2 movidas a `03-Completado-Archivo`. Esto es igual a lo que pasa con la RAM real: se acumulan procesos porque es más fácil abrir uno nuevo que cerrar uno viejo. Pero, a diferencia de la RAM real, aquí la "saturación" no me generó errores ni bloqueos — solo me obligó a decidir prioridades. Lo que sí gané fue exactamente lo que un buen manejo de memoria debería darme: distinguir de un vistazo qué tareas ya entregué y cuáles todavía me faltan, sin tener que recordarlo todo yo. Por eso considero que esta parte del sistema es de mucha utilidad, aunque en mi caso funcionó más como un tablero de estado que como una memoria que realmente se "libera" sola.

---

## 3. Planificación de Procesos (Scheduling)

**Concepto SO:** El kernel mantiene una "cola de listos" de procesos esperando CPU, ordenados por prioridad.

**Cómo funciona en tu vault:**
- `02-Cola-Pendientes/` = la cola de listos de tareas
- La consulta **Dataview** que instalaste lista estas tareas por prioridad/fecha
- Es literalmente el scheduler: "¿cuál hago primero?"

**¿Cómo lo experimentas tú?**
No reviso la cola cada mañana como haría un scheduler que corre en cada ciclo de reloj — en eso el paralelo se rompe un poco, porque un SO real planifica de forma constante y automática, mientras que yo la reviso "por evento": siempre que voy a empezar a hacer una tarea o a estudiar, abro `02-Cola-Pendientes` para cerciorarme de que no me falta nada. Es más parecido a una planificación bajo demanda que a un scheduler preventivo, pero cumple la misma función: antes de "darle CPU" a una tarea, primero consulto la cola completa para elegir bien.

---

## 4. Concurrencia

**Concepto SO:** Múltiples procesos compiten por el mismo CPU/RAM. En tu caso: dos sistemas usan el mismo Ollama.

**Cómo funciona en tu vault:**
- Si usas Segundo Cerebro (Obsidian) mientras RFC AI Gen está corriendo, **ambos compiten por la misma VRAM GPU**
- Puedes medir esto en vivo: `nvidia-smi` mientras corres Local GPT, mientras Santiago corre en otra ventana
- Esta no es una analogía abstracta — es literal, medible

**¿Cómo lo experimentas tú?**
Usé Local GPT con bastante frecuencia, casi cada vez que no quería resolver yo mismo el análisis inicial de una tarea, porque el modelo (mistral-nemo corriendo en Ollama) me resultó muy útil para analizar contenido. Sin embargo, tengo que ser honesto en un punto: no llegué a forzar el escenario de concurrencia "real" que describe la tabla de analogías, es decir, no medí en vivo qué pasaba con la VRAM al correr Ollama junto con otro programa igual de pesado al mismo tiempo. Aquí el paralelo se queda más en lo teórico para mí: sé que ambos procesos competirían por la misma GPU si corrieran juntos, pero no lo comprobé con datos (como `nvidia-smi`) durante estas dos semanas. Es una limitación de mi bitácora, no del sistema.

---

## 5. Interrupciones

**Concepto SO:** Un evento externo (llegó un paquete, presionaste Ctrl+C) detiene el flujo normal.

**Cómo funciona en tu vault:**
- Llega una tarea urgente → va directamente a `00-Bandeja-Entrada/`
- Eso dispara un flujo de "procesamiento" manual (o automático vía Templater después)
- Es una interrupción: interrumpe lo que estabas haciendo

**¿Cómo lo experimentas tú?**
Sí funcionó como una interrupción real: cuando me llega algo muy importante, lo pongo en primer lugar ante todo, exactamente como una interrupción de alta prioridad que le "roba" el turno al proceso que estaba corriendo. En vez de dejarlo esperando en `00-Bandeja-Entrada`, esas tareas urgentes casi siempre saltan directo a atenderse antes que cualquier otra cosa que estuviera haciendo en ese momento. Ahí la analogía se cumple bien: la bandeja no es solo un buzón pasivo, es el punto donde algo externo puede reordenar mis prioridades de golpe.

---

## 6. Gestión de Recursos

**Concepto SO:** El SO administra RAM, CPU, GPU, disco. Debe repartir para que varios procesos no se maten.

**Cómo funciona en tu vault:**
- Ollama consume RAM/VRAM real (lo viviste esta sesión: 6GB VRAM total)
- Local GPT va a competir con RFC AI Gen si lo ejecutas juntos
- Dataview consume CPU procesando consultas sobre todas tus notas

**¿Cómo lo experimentas tú?**
En mis dos semanas de uso no llegué a un punto donde el sistema se quedara sin recursos ni tuve que cerrar otro programa para que Local GPT respondiera — probablemente porque, como mencioné en la sección de concurrencia, no probé correr dos cargas de IA pesadas al mismo tiempo. Lo que sí es literal, y no metafórico, es que cada vez que usé Local GPT supe que ese análisis estaba costando RAM/VRAM real en mi máquina, algo muy distinto a simplemente escribir texto en una nota. Esa conciencia de "esto sí consume un recurso físico" es justo la diferencia entre esta analogía y las demás: aquí no estoy simulando la gestión de recursos, la estoy viviendo, aunque no la haya llevado al límite.

---

## 7. Entrada/Salida (I/O)

**Concepto SO:** El kernel media entre dispositivos (disco, teclado, red) y programas.

**Cómo funciona en tu vault:**
- **Entrada:** teclado (escribes notas), Local GPT (texto que pides resumir/etiquetar)
- **Salida:** notas guardadas en disco, sugerencias de Local GPT
- Obsidian = el intermediario (como el kernel)

**¿Cómo lo experimentas tú?**
El flujo de entrada → procesamiento → salida sí se sintió natural: escribo o pego información (entrada), Local GPT la procesa, y obtengo una nota más clara u organizada (salida). En concreto, usar Local GPT me sirvió para entender mejor las tareas: al pedirle que analizara o resumiera una descripción, terminaba viendo con más claridad qué se me estaba pidiendo. No fue ruido en mi caso — fue la pieza que le dio sentido real al resto del sistema, porque sin ella la bóveda seguiría siendo solo archivos guardados, sin ese paso intermedio de interpretación.

---

## 8. Kernel vs Espacio de Usuario

**Concepto SO:** Kernel = software privilegiado que controla hardware. Espacio de usuario = tus programas.

**Cómo funciona en tu vault:**
- **Kernel** = Ollama (motor de IA, acceso directo a GPU, procesa peticiones)
- **Espacio de usuario** = Obsidian + tú (interactúas con la interfaz, no directamente con GPU)
- Local GPT = el "syscall" que hace la petición al kernel

**¿Cómo lo experimentas tú?**
Esta es la analogía que menos noté "en vivo": para mí, usar Local GPT se sintió como una sola acción (seleccionar texto, pedir el análisis, recibir la respuesta), no como dos capas separadas. Sé, porque así está construido el sistema, que en realidad Obsidian nunca toca el modelo directamente — Local GPT hace la petición a Ollama por su cuenta, y Ollama es el único que habla con la GPU, igual que un programa de usuario nunca toca el hardware directo y siempre pasa por el kernel. Pero como usuario no llegué a percibir esa espera o esa frontera de forma consciente; simplemente confié en que "funcionaba". Creo que ahí está uno de los límites honestos de la analogía: la separación de capas existe y es real en la arquitectura, pero desde la experiencia de uso queda oculta — que es, curiosamente, la señal de que un buen sistema operativo está haciendo bien su trabajo: uno no debería notar el kernel.

---

## Reflexión Final (después de 3-4 semanas)

**¿Qué concepto de SO te sorprendió más viéndolo en tu propio sistema?**

Lo que más me sorprendió fue la gestión de memoria (RAM vs. disco), porque no esperaba que separar mis tareas en "activas" (01-En-Proceso) y "archivadas" (03-Completado-Archivo) fuera a cambiar tanto la forma en que veo mi propio trabajo. Antes, mi problema real era justo ese: descargaba archivos y tareas, y con el tiempo se acumulaban en un solo lugar (mi carpeta de Descargas) sin ningún criterio, hasta que ya no podía encontrar nada. Ver ese mismo patrón de acumulación replicado — pero ahora de forma ordenada y visible, con conteos claros de qué está activo y qué ya cerré — me hizo entender de una forma mucho más concreta por qué un sistema operativo necesita distinguir entre memoria de trabajo y almacenamiento permanente: no es solo una cuestión de velocidad de hardware, es una cuestión de no perder de vista lo que importa en el momento.

En general, después de dos semanas de uso real me parece una herramienta muy buena y de mucha utilidad para mi caso concreto: sí resolvió el problema de que mis tareas y documentos se perdieran, y sí me ayudó a distinguir con claridad qué llevo entregado y qué me falta. Pero también creo que no es la mejor opción para cualquier persona — requiere cierta disciplina para clasificar cada entrada, instalar y mantener Ollama corriendo, y acostumbrarse a revisar la cola antes de trabajar. Para alguien que ya batalla con el orden (como me pasaba a mí antes), ese costo inicial de aprender el sistema puede ser justo la barrera que le impida usarlo, aunque a mí sí me terminó funcionando.

