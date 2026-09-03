# Source Review: DDD Europe 2026

## Resumen

- Esta revisión contrasta `design-context` v0.5.0 con material directo y adyacente de DDD Europe 2026.
- La señal principal no es reemplazar DDD por ingeniería de agentes, sino reforzar el modelado como actividad colaborativa, situada y evolutiva.
- Los artefactos versionados son expresiones duraderas y operativamente autoritativas del modelo; no contienen por sí solos toda la teoría ni el conocimiento tácito del dominio.
- Los agentes encajan mejor como generadores de hipótesis, críticos, sintetizadores, clasificadores y ejecutores verificables que como autoridades de dominio.
- La formulación provisional para v0.6.0 es **living, bounded and verifiable domain context**.
- No se aplicaron cambios canónicos durante esta revisión.

## Estado

Documento de investigación **source-only**. Informa propuestas de cambio, pero no redefine `context/**`, los ADR ni el pack vendible.

## Trigger

La entrada de Martin Fowler del 16 de junio de 2026 señaló que DDD podría adquirir más importancia con LLMs y remitió a DDD Europe. Una primera pasada quedó sesgada hacia FOSE y harness engineering. Esta segunda pasada busca recuperar el contenido propio de la conferencia y responder:

- qué sigue siendo esencial de DDD ante los LLMs;
- qué papel pueden tener los agentes en descubrimiento, modelado y aplicación;
- qué conocimiento no cabe en un repositorio;
- qué huecos reales tiene v0.5.0;
- cómo debería reajustarse v0.6.0.

La nota de Fowler se usa como punto de descubrimiento, no como sustituto de la conferencia.

## Ventana y método

- Revisión cerrada: 2026-09-04.
- Programa consultado: `https://2026.dddeurope.com/program/`.
- Playlist oficial consultada: `https://www.youtube.com/playlist?list=PLf9p-N3ltMTsP-VkU_Oj6_8HUM8-xRP1M`.
- Las páginas, slides y subtítulos se descargaron únicamente a archivos temporales para su inspección.
- Las afirmaciones se parafrasearon; no se incorporaron transcripciones ni decks al repositorio.
- Cada afirmación se contrastó con el hogar canónico más pequeño que podría absorberla.

### Jerarquía de evidencia

| Nivel | Evidencia | Uso permitido |
|---|---|---|
| A | grabación o deck entregado en la conferencia | evidencia directa de lo presentado, con la salvedad de que las slides no contienen toda la explicación oral |
| B | abstract o página oficial de sesión | evidencia del contenido propuesto, no de su entrega, debate ni resultado |
| C | material propio del ponente, cercano en tema y fecha | apoyo para interpretar una hipótesis; no se atribuye a la sesión inédita |
| D | panel, perfil o publicación relacionada | triangulación y generación de hipótesis, nunca sustituto de material directo |

## Registro de fuentes

| Source id | Fuente | Nivel y disponibilidad | Papel en el framework |
|---|---|---|---|
| `dde26-program` | [Programa oficial](https://2026.dddeurope.com/program/) | B; disponible | mapa de sesiones y materiales enlazados |
| `dde26-playlist` | [Playlist oficial 2026](https://www.youtube.com/playlist?list=PLf9p-N3ltMTsP-VkU_Oj6_8HUM8-xRP1M) | A; seis elementos al cerrar la revisión | comprobar disponibilidad sin convertir ausencia en evidencia negativa |
| `dde26-evans-keynote` | [Opening Keynote Eric Evans](https://2026.dddeurope.com/program/opening-keynote-eric-evans/) | B; grabación no publicada | hipótesis sobre modelos, lenguaje, límites y componentes LLM |
| `dde26-troy` | [The Curse of Unbounded Contexts](https://2026.dddeurope.com/program/the-curse-of-unbounded-contexts-using-domains-as-llm-consumers/) y [deck](https://drive.google.com/file/d/1xUzkirdLDDYMvVnAfR-8qNLw3qu06Ba9/view?usp=sharing) | A; deck de 27 slides | alcance, vocabulario, modo, pivotes y handoff en interacciones LLM |
| `dde26-pidvolotska` | [Designing Reliable Distributed Systems](https://2026.dddeurope.com/program/designing-reliable-distributed-systems-failures-retries-idempotency/) y [deck](https://docs.google.com/presentation/d/1Nloccjz4XFSBfy5x6mCpRFaKCPZs_IQ_fSam3YdmPoM/edit?usp=sharing) | A; deck de 77 slides | fallos parciales, retries, resultado desconocido e idempotencia |
| `dde26-hermans` | [AI made me doubt everything about programming](https://www.youtube.com/watch?v=0-6-f94n_9M) | A; grabación oficial completa | propósito, epistemología, teoría del programa y responsabilidad humana |
| `dde26-panel` | [Loosely Coupled: Domain-Driven Design and more](https://www.youtube.com/watch?v=g5WfzxSktc4) | A/D; grabación completa en canal externo | límites de la colaboración textual, modelado colectivo y conocimiento no documentado |
| `evans-ai-deterministic-2025` | [AI Components for a Deterministic System](https://www.domainlanguage.com/articles/ai-components-deterministic-system/) | C; Eric Evans, 2025-08-24 | separar modelado y clasificación; estabilizar salidas probabilísticas |
| `evans-ai-context-map-2026` | [Context Mapping with an AI-based Component](https://www.domainlanguage.com/articles/context-mapping-an-ai-based-component/) | C; Eric Evans, 2026-01-06 | Published Language, mapas honestos y traducción en la frontera IA |
| `dde26-ai-coexpert` | [Can AI be a Co-Domain Expert?](https://2026.dddeurope.com/program/can-ai-be-a-co-domain-expert-in-domain-modelling/) | B; abstract, sin artefacto entregado | procedencia visible para sugerencias de IA y validación humana |
| `dde26-domain-memory` | [Building Domain Memory](https://2026.dddeurope.com/program/building-domain-memory-to-preserve-your-systems-why/) | B; el enlace de slides lleva a una charla de 2025 | conocimiento tácito, teoría del sistema y continuidad mediante colaboración |
| `dde26-collaborative-types` | [Collaborative Data Modeling](https://2026.dddeurope.com/program/collaborative-data-modeling-discovering-domain-types-through-linguistic-cues/) | B; abstract | descubrir formas de datos mediante pistas lingüísticas accesibles a expertos |
| `dde26-model-expressions` | [Model Expressions](https://2026.dddeurope.com/program/model-expressions-an-overlooked-aspect-of-domain-driven-design/) | B; abstract | múltiples expresiones parciales del modelo y deriva entre capas |
| `dde26-testing` | [Testing DDD Building Blocks](https://2026.dddeurope.com/program/testing-ddd-building-blocks-a-multi-layered-strategy-for-confidence/) y [deck](https://drive.google.com/file/d/1zhsKyIFNbHxcw7B6SdY_4VtCkSLMfEC5/view?usp=sharing) | A; deck de 98 slides | alcance de pruebas derivado de responsabilidades y límites |
| `dde26-multilingual` | [When the ubiquitous language isn't English](https://2026.dddeurope.com/program/when-the-ubiquitous-language-isnt-english/) y [deck](https://noti.st/punkstarman/WLhpbe/when-the-ubiquitous-language-isnt-english) | A; deck de 40 slides | política explícita de idioma, traducción y términos de negocio |
| `kiran-data-products-2024` | [Designing data products](https://martinfowler.com/articles/designing-data-products.html) | D; publicación propia de Kiran Prakash, 2024-12-10 | diseñar desde casos de uso, superponer casos y evitar sobreajuste |
| `dde26-evans-fowler-interview` | [Interview with Martin Fowler and Eric Evans](https://2026.dddeurope.com/program/interview-with-martin-fowler-and-eric-evans/) | B; grabación no localizada | seguimiento pendiente, sin afirmaciones importadas |
| `dde26-kiran-profile` / `dde26-tom-profile` | [Kiran Prakash](https://2026.dddeurope.com/speakers/kiran-prakash/) y [Tom De Wolf](https://2026.dddeurope.com/speakers/tom-de-wolf/) | D; perfiles sin sesión enlazada | registrar la búsqueda; no atribuirles contenido de conferencia no disponible |

## Auditoría de disponibilidad

Al cerrar esta revisión, la playlist oficial contenía seis elementos y solo una charla completa del programa: la de Felienne Hermans. No estaban publicadas allí las sesiones de Eric Evans, Chelsea Troy, Violetta Pidvolotska, Jacek Milewski, Kiran Prakash o Tom De Wolf, ni la entrevista Evans/Fowler.

Consecuencias:

- la ausencia se registra como **material aún no disponible**, no como evidencia negativa;
- el deck de Chelsea y el de Violetta permiten revisar estructura y recomendaciones, pero no Q&A ni matices orales;
- la keynote de Eric se interpreta solo mediante su abstract y material propio anterior claramente separado;
- no se formulan afirmaciones sobre las intervenciones exactas de Kiran o Tom.

## Afirmaciones revisadas

| Claim id | Afirmación portable | Evidencia | Hogar actual y clasificación | Respuesta propuesta | Confianza |
|---|---|---|---|---|---|
| `dde26-01` | Un modelo de dominio es un sistema de abstracciones para un propósito, no un artefacto concreto. | Evans C; keynote B | glosario y principio 02: **new gap** | definir `domain model` sin importar el experimento concreto | media-alta |
| `dde26-02` | Código, conversación, UI, schemas, tests, datos y documentación son expresiones parciales del modelo; su deriva revela tensión de diseño. | Model Expressions B; Hermans A | principios 02 y 11: **partial gap** | introducir la distinción sin convertir una charla en taxonomía obligatoria | media |
| `dde26-03` | El repositorio puede ser autoridad operativa para agentes sin contener todo el conocimiento tácito o situado. | Domain Memory B; panel A/D; Hermans A | principio 01 y playbook 11: **partial gap** | matizar `source of truth` y exigir rutas de validación humana | alta |
| `dde26-04` | Las sugerencias de IA deben conservar procedencia y grado de aceptación; un agente no debe rellenar huecos como autoridad de dominio. | AI Co-Expert B; panel A/D | playbook 01 y review 06: **new gap** | distinguir observado, confirmado, inferido, especulativo, disputado y desconocido | media-alta |
| `dde26-05` | Modelar y clasificar son trabajos distintos: el primero explora alternativas para un propósito; el segundo aplica un modelo aceptado. | Evans C | playbooks 01 y 11: **new gap** | separar descubrir, seleccionar, aplicar y verificar | alta |
| `dde26-06` | Para un subdominio genérico, un modelo estándar maduro puede ser mejor que una taxonomía propia; actúa como Published Language. | Evans C | playbook 10: **partial gap** | añadir la opción y sus trade-offs, no NAICS como regla | alta |
| `dde26-07` | Un context map debe etiquetar honestamente lo observado, lo exploratorio y lo propuesto. | Evans C | principio 03 y playbook 02: **new gap** | añadir estado `as-is`, `exploratory`, `proposed` o `transitional` | alta |
| `dde26-08` | Una frontera entre software determinista y un componente probabilístico necesita traducción, validación y rechazo de salidas fuera del modelo aceptado. | Evans C; keynote B | playbook 10 y pattern 01: **partial gap** | reforzar ACL/translation seam sin declarar que todo LLM es un bounded context | alta |
| `dde26-09` | Una interacción LLM no trivial mejora al declarar alcance, vocabulario y modo, y al transferir conclusiones en vez del transcript completo. | Troy A | playbook 11 y pattern 04: **new gap** | añadir un interaction charter y modos operativos | alta |
| `dde26-10` | Cambiar de modo o realizar un pivote puede justificar un contexto de trabajo limpio; cifras exactas de mensajes o correcciones no son universales. | Troy A | agent orchestration: **needs benchmark** | incorporar el principio, no los umbrales concretos | media-alta |
| `dde26-11` | Las pistas del lenguaje experto permiten descubrir alternativas, composición, opcionalidad, multiplicidad e identidad de forma colaborativa. | Collaborative Data Modeling B | playbook 01 y principio 07: **partial gap** | añadir descubrimiento lingüístico antes de traducir a tipos | media |
| `dde26-12` | Contrastar varios casos de uso evita sobreajustar límites y conceptos al primer ejemplo. | Kiran D | playbook 01: **partial gap / needs benchmark** | exigir escenarios contrastantes sin fijar un número mágico | media |
| `dde26-13` | En sistemas distribuidos, éxito, fallo y resultado desconocido son estados diferentes; una clave de idempotencia representa intención de negocio. | Pidvolotska A | principios 04/05 y playbooks 03/09: **partial gap** | afinar resultados, retry budget, duplicados, verdad y reconciliación | alta |
| `dde26-14` | El alcance de una prueba debe seguir la responsabilidad y la confianza requerida en agregados, módulos, contratos y contextos, no una pirámide genérica. | Milewski A | review 02 y agent validation: **partial gap** | añadir preguntas de riesgo/confianza; evitar una taxonomía universal | media-alta |
| `dde26-15` | En equipos multilingües, elegir idioma y traducción es una decisión de modelado; los términos nativos pueden preservar significado. | Bartlett A | principio 02, playbook 10 y review 04: **partial gap** | documentar política, traducciones y términos deliberadamente no traducidos | media-alta |
| `dde26-16` | La elección del problema, las personas afectadas y la responsabilidad sobre el resultado no se delegan a la generación técnica. | Hermans A; panel A/D | playbook 01 y vision: **partial gap** | reforzar outcome, perspectivas presentes/ausentes y aceptación humana | alta |

## Hallazgos por capacidad

### Modelo vivo y memoria de dominio

v0.5.0 ya conecta lenguaje, artefactos, código y evolución, pero puede inducir una lectura documental: si el repositorio está completo, el modelo estaría completo. La evidencia revisada sugiere una formulación más precisa:

- el modelo es una teoría útil para un propósito;
- los artefactos versionados preservan expresiones, decisiones y evidencia;
- el conocimiento tácito y la capacidad de explicar o discutir requieren colaboración humana continuada;
- la documentación debe hacer visibles sus límites y el camino hacia quien puede validar.

### Modelado colaborativo y procedencia

El playbook actual entrevista expertos y recoge lenguaje, pero no distingue suficientemente la procedencia ni el grado de aceptación. Para trabajo asistido por agentes debe resultar difícil confundir una propuesta plausible con conocimiento confirmado.

La mínima adición portable es una etiqueta de procedencia y una persona o grupo responsable de aceptar decisiones de modelado estratégicas.

### Límites estratégicos y evolución

Las fronteras existentes están bien cubiertas semánticamente. Faltan dos distinciones:

- mapa observado frente a mapa deseado o transicional;
- sistema probabilístico como modelo extranjero que requiere contrato, traducción y comprobaciones deterministas.

La primera evita arquitectura aspiracional presentada como realidad. La segunda permite aprovechar LLMs sin hacer que proveedor, prompt o formato posean el modelo central.

### Interacción humano-agente

El aporte portable de Chelsea no es redefinir `bounded context`. Es gestionar explícitamente una sesión mediante:

```text
scope + vocabulary + mode + constraints + expected handoff
```

Los modos `explore`, `brainstorm`, `decide` e `implement` evitan que una alternativa exploratoria se convierta por inercia en decisión o código. Un pivote debe conservar decisiones y restricciones, no todo el camino que saturó el contexto anterior.

### Confiabilidad y pruebas

Violetta y Jacek desplazan la discusión desde mecanismos genéricos hacia significado y confianza:

- un timeout puede dejar el resultado desconocido;
- retry e idempotencia deben corresponder a intención y política de negocio;
- los sistemas necesitan una autoridad y una ruta de reconciliación cuando discrepan;
- la prueba adecuada depende de la responsabilidad y del riesgo del límite observado.

### Propósito y responsabilidad

La verificación responde si una implementación satisface un criterio. No responde por sí sola si el criterio representa un problema valioso, qué voces faltan ni quién acepta el trade-off. DDD y agent-operability deben conservar esa separación.

## Tesis reequilibrada para v0.6.0

La formulación `verifiable design context` sigue siendo útil, pero demasiado estrecha. La tesis propuesta es:

> `design-context` ayuda a humanos y agentes a construir, cuestionar, aplicar y evolucionar modelos compartidos de dominios complejos. Mantiene expresiones compactas y versionadas de lenguaje, propósito, límites, supuestos, decisiones, workflows y evidencia, sin confundir esos artefactos con el conocimiento vivo ni reemplazar a las personas que lo sostienen.

Nombre provisional:

> **Living, Bounded and Verifiable Domain Context**

Orden de prioridades:

1. propósito y personas;
2. conocimiento y modelo;
3. lenguaje y límites;
4. expresiones y evolución;
5. agentes e implementación;
6. evidencia y verificación.

## Propuestas canónicas, aún no aplicadas

| Id | Target mínimo | Cambio pretendido | Riesgo y revisión |
|---|---|---|---|
| `dde26-prop-01` | `README.md`, `vision.md` | presentar colaboración humano-agente, conocimiento vivo y verificabilidad subordinada al propósito | revisar promesa del producto; no convertir fuentes recientes en fundamento |
| `dde26-prop-02` | glosario, principios 01/02 | definir `domain model`, distinguir sus expresiones y matizar autoridad operativa frente a completitud epistémica | revisión de vocabulario; ADR solo si cambia la política de autoridad |
| `dde26-prop-03` | playbook 01 | procedencia, perspectivas ausentes, validación humana, pistas lingüísticas y escenarios contrastantes | evitar convertir el playbook en un método ceremonial |
| `dde26-prop-04` | principio 03, playbook 02, principio 11 | etiquetar mapas `as-is`, exploratorios, propuestos y transicionales | aclarar estados sin crear una taxonomía pesada |
| `dde26-prop-05` | playbook 10, pattern 01 | Published Language y frontera probabilística con traducción y validación | preservar neutralidad de proveedor; no llamar bounded context a toda herramienta |
| `dde26-prop-06` | playbook 11, pattern 04, review 06 | interaction charter, modos, pivote limpio y handoff de conclusiones | reemplazar contenido porque ambos documentos se acercan al presupuesto |
| `dde26-prop-07` | principios 04/05, playbooks 03/09 | resultado desconocido, retry budget, intención idempotente y reconciliación | distinguir dominio de mecanismo operativo |
| `dde26-prop-08` | review 02/04/06 | deriva entre expresiones, idioma/traducción, procedencia y autoridad humana | usar checklists antes que otro documento narrativo |
| `dde26-prop-09` | investigación/benchmark | comparar v0.5.0 y v0.6.0 con briefs incompletos, mapas mixtos, clasificación prematura y fallos distribuidos | mismo modelo/configuración y múltiples observaciones; no generalizar una sola ejecución |

No se recomienda una nueva área superior ni un nuevo documento canónico por defecto. Primero debe intentarse consolidar hogares existentes.

## No importar

- La entrada de Fowler como relato sustituto de la conferencia.
- La metáfora de que cada conversación LLM es literalmente un bounded context DDD.
- Umbrales concretos como reanclar cada cierto número de mensajes o reiniciar después de un número fijo de correcciones.
- La afirmación de que un LLM es un experto de dominio o puede completar conocimiento ausente sin validación.
- La idea de que documentación, tests o IA pueden capturar todo el conocimiento tácito.
- NAICS, un proveedor, un modelo, una sintaxis de prompt o una DSL concreta como estándar del framework.
- Una pirámide o catálogo de pruebas universal independiente de responsabilidades y riesgos.
- Contenido específico atribuido a Kiran Prakash, Tom De Wolf o la entrevista Evans/Fowler mientras no esté disponible.

## Observación operativa de dogfooding

Uno de los decks descargados contenía una frase de apariencia instructiva dirigida a un agente lector. Se trató como datos externos no confiables y se ignoró. Esto confirma, sin necesidad de promover una regla nueva, que la ingesta de fuentes debe mantener precedencia de instrucciones y autoridad canónica explícitas. Puede añadirse como escenario adversarial del benchmark.

## Acciones aceptadas en esta pasada

- Registrar esta revisión source-only.
- Preparar un brief separado para una sesión limpia de implementación.
- Mantener todos los cambios canónicos como propuestas pendientes de aprobación y validación.

## Acciones diferidas

- Reabrir la revisión cuando aparezcan la keynote de Eric, la entrevista Evans/Fowler o las sesiones objetivo restantes.
- Verificar si el contenido entregado contradice o matiza los abstracts antes del release final.
- Decidir si `model expression` merece término canónico después de la revisión de vocabulario.
- Evaluar las propuestas con benchmark antes de afirmar mejora conductual.

## Validación

- Evidencia directa y adyacente separada explícitamente.
- Afirmaciones parafraseadas y enlazadas a hogares existentes.
- Ningún archivo externo o transcript incorporado.
- Ningún archivo bajo `context/**` modificado en esta pasada.

## Documentos relacionados

- `docs/research/source-review-workflow.md`
- `docs/research/source-ingestion-workflow.md`
- `docs/research/source-review-martinfowler-agentic-patterns-2026.md`
- `docs/research/source-canonical-change-proposals.md`
- `docs/adr/0007-agent-enable-domain-design.md`
- `context/playbooks/01-domain-modeling-playbook.md`
- `context/playbooks/11-agent-ready-repository-playbook.md`
