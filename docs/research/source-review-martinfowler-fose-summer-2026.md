# Source Review: Martin Fowler / FOSE Summer 2026

## Resumen

- Esta nota completa **R0** y **R1** de la segunda pasada v0.6.1; **R2 no se ha iniciado**.
- El baseline de comparación es exclusivamente el tag anotado `v0.6.0`, resuelto al commit `83701edc9ccfdf50fe05e6311081b41d8eb25b97` y al tree `8f69647ff448558940abfeb8f08e2ec30c1b298e`.
- El corpus queda cerrado a los 23 artefactos Fowler/FOSE realmente descargados en la primera pasada y a los source ids ya registrados por la revisión DDD Europe 2026. No se siguieron enlaces nuevos.
- Las tres entradas Fowler de julio, el informe y los relatos de asistentes describen el mismo retiro de Engelberg. Constituyen **un bundle correlacionado**, no confirmaciones independientes.
- Las cifras del retiro, relatos, fragments y artículos sin método reproducible se conservan solo como anécdotas o señales. El paper `arXiv:2601.02200v1` conserva valor empírico limitado a su tarea, muestra y métrica.
- La disponibilidad DDD Europe no cambió: la playlist oficial conserva los mismos seis vídeos y ninguna sesión pendiente ganó una grabación enlazada desde su página oficial.
- El mapping inicial contra v0.6.0 encuentra cobertura amplia, tres hipótesis que necesitan benchmark y una tensión parcial sobre comprensión humana. No identifica evidencia suficiente para un cambio canónico inmediato.
- Todo material externo se trató como datos no confiables. No se siguió ninguna instrucción incrustada y no se incorporaron fuentes crudas al repositorio.

## Estado y límite de esta pasada

Documento de investigación **source-only**.

| Corte | Estado | Resultado |
|---|---|---|
| R0 — corpus y protocolo | completado | inventario, hashes, delta de disponibilidad, preguntas, fixtures y scoring congelados |
| R1 — Fowler/FOSE | completado | jerarquía, claims parafraseados, límites, no-importación y mapping inicial contra v0.6.0 |
| R2 — source-to-release audit | **no iniciado** | handoff al final de esta nota |

Esta nota no redefine `context/**`, ADR, README, visión ni documentos de producto. Tampoco actualiza todavía `source-inventory.md` ni `source-canonical-change-proposals.md`; la propuesta reserva esas actualizaciones para el cierre de decisiones.

# R0 — corpus y protocolo congelados

## Baseline reproducible

| Campo | Valor |
|---|---|
| Tag solicitado | `v0.6.0` |
| Objeto commit | `83701edc9ccfdf50fe05e6311081b41d8eb25b97` |
| Tree | `8f69647ff448558940abfeb8f08e2ec30c1b298e` |
| Fecha del commit | `2026-09-04T10:46:17+02:00` |
| Ventana de captura externa | `2026-09-04T09:02:54Z–09:11:30Z` |
| Runtime fijado para evaluación posterior | Pi `0.84.3` |
| Estado de superficies comparadas | sin diferencias entre el working tree y `v0.6.0` en `context/**`, `docs/adr/**`, README, visión o producto al congelar |

`v0.6.0` fija el contenido de los hogares canónicos. Los hashes siguientes fijan los bytes externos descargados en esta ventana; no convierten una URL mutable en archivo histórico. HTML dinámico y metadata de YouTube pueden producir otro hash sin que cambie la afirmación relevante. Los bytes crudos y las conversiones de inspección permanecieron temporales y no forman parte del pack vendible.

## Regla exacta de corpus

El corpus Fowler/FOSE se reconstruyó desde la lista de descargas de la primera pasada que originó el plan v0.6.0:

1. las cuatro URLs solicitadas por el mantenedor;
2. los 17 documentos enlazados que aquella pasada descargó efectivamente;
3. el informe Thoughtworks FOSE Europe;
4. `arXiv:2601.02200v1`.

El corpus DDD Europe es exactamente el registro de fuentes de `source-review-ddd-europe-2026.md`. Comprobar una grabación nueva de una sesión ya nombrada no ampliaría el corpus; seguir otro artículo, autor, búsqueda o enlace sí lo ampliaría y queda prohibido en esta pasada.

El índice FOSE hoy enlaza más relatos de asistentes que los descargados originalmente. Esos relatos **no se añadieron**. Tampoco se descargaron estudios subyacentes citados solo por un fragment, nuevas experiencias sobre modelos locales ni referencias encontradas durante la captura.

## Jerarquía de evidencia congelada

| Nivel | Evidencia | Uso permitido |
|---|---|---|
| E1 | estudio empírico con muestra, tarea y método inspeccionables | sostener únicamente la asociación medida, conservando validez externa, conflictos y estado de publicación |
| E2 | caso técnico o análisis propio con ejemplos inspeccionables | generar o calibrar un claim portable; no afirmar replicación ni efecto general |
| E3 | informe agregado, notas o relato de participante del retiro | describir temas y experiencias reportadas; todos los artefactos de Engelberg comparten la clave de independencia `RET26` |
| E4 | fragment editorial, precursor, opinión o contexto | descubrimiento, contradicción o hipótesis; no promoción por sí solo |

Los niveles no son votos. Cinco documentos E3 con clave `RET26` cuentan como una procedencia correlacionada. Dos autores que narran la misma sesión tampoco crean dos experimentos.

## Inventario Fowler/FOSE congelado

Todos los artefactos devolvieron HTTP 200. El hash es SHA-256 de los bytes guardados tras resolver redirecciones y descompresión HTTP.

| Source id | Fecha | Tipo, rol y nivel | URL | SHA-256 |
|---|---:|---|---|---|
| `mf-frag-2026-06-16` | 2026-06-16 | fragment; entrada DDD y modos de conversación; E4 | [Fragments: June 16](https://martinfowler.com/fragments/2026-06-16.html) | `2eaaf6afdf107a7fa27bef1a87e3fa1d1d4df82a06a191106451288e7f668e6d` |
| `mf-frag-2026-07-06` | 2026-07-06 | fragment del retiro; E3/`RET26` | [Fragments: July 6](https://martinfowler.com/fragments/2026-07-06.html) | `3e17299d3f83cf77e4fdfef16c31144b1493a5fb166eddd2152b3ae65cc416de` |
| `mf-frag-2026-07-13` | 2026-07-13 | fragment del retiro; E3/`RET26` | [Fragments: July 13](https://martinfowler.com/fragments/2026-07-13.html) | `331c447e753d002762da116a3de9cd30b2d3807d6a94ec2fdb31741bdbde9d3f` |
| `mf-frag-2026-07-21` | 2026-07-21 | fragment del retiro y resumen del informe; E3/`RET26` | [Fragments: July 21](https://martinfowler.com/fragments/2026-07-21.html) | `9676cec705ccb0e14ab03c441e57312b45c46eb8f4c1a06341398df6f2f1cda3` |
| `mf-fose-index` | 2026-07-02 | índice mutable; metadata, E4 | [Future Of Software Development](https://martinfowler.com/bliki/FutureOfSoftwareDevelopment.html) | `b76be77d4699e7b82ea3045f0f3b68b814516faf487eda3657a5610b6c3581b8` |
| `tw-fose-europe-report` | 2026-07-13 | informe agregado de 40 sesiones; E3/`RET26` | [The Future of Software Engineering — Europe](https://www.thoughtworks.com/content/dam/thoughtworks/documents/report/tw_future_of_software_engineering_europe_2026.pdf) | `f9e5663e94529113adb698d2ed77bd18c83e3664baa24d1d0377453c8e3c4ce1` |
| `giles-fose-europe` | 2026-07-01 | primeras impresiones de anfitrión/asistente; E3/`RET26` | [Notes from FOSE Europe](https://overwatering.org/blog/2026/07/notes-from-fose-europe/) | `8a9d58b5164ebac9035c6e3380041016ba02b726f59342881ad7cccdea4b5d0f` |
| `greg-retreat-observations` | 2026-07-01 | relato de asistente; E3/`RET26` | [We've Stopped Arguing About Whether](https://blog.herlein.com/post/retreat-observations/) | `05f5b194778b61574bf845b97f5fc3f06077535171adffc80141a7071d81db28` |
| `verraes-agentic-design` | 2026-07-02 | relato y posición de asistente; E3/`RET26` | [Software Design in the Agentic Age](https://verraes.net/2026/07/software-design-in-the-agentic-age/) | `7529d8096cb37ab542c3930148fc811de9f28a5b5dd0d55b77e3b4c856df7342` |
| `kief-fose-july` | 2026-07-09 | síntesis de asistente; E3/`RET26` | [The Argument Underneath the Arguments](https://infrastructure-as-code.com/posts/fose-july-2026.html) | `bf4e09d150f49a0259862550ac35943070a60fc03af6b9e1f8addbb7cd206fc5` |
| `ruby-survived-contact` | 2026-07-01 | relato de asistente y caso único declarado; E3/`RET26` | [What Survived Contact](https://intertwingly.net/blog/2026/07/01/What-Survived-Contact.html) | `e938300960f8737c63781769418a3fceae36a6b0a3ee7cc604cdd7fa259cd480` |
| `ruby-bring-rock` | 2026-06-27 | hipótesis precursora al retiro; E4 | [Bring Me a Rock](https://intertwingly.net/blog/2026/06/27/Bring-Me-a-Rock.html) | `7fc7bd46363c7f256e93feddd0b2ee36a5ecdd9f9c367e692ff5f5631d80237c` |
| `mf-harness-engineering` | 2026-04-02 | análisis técnico de Birgitta Böckeler; E2; ya revisado en mayo | [Harness engineering for coding agent users](https://martinfowler.com/articles/harness-engineering.html) | `136255eca705206a09b0fdb9f24b1a074d897c9eed02a2c07e0bc04f17341986` |
| `adam-humans-machines` | 2026-04-19 | ensayo técnico de Adam Tornhill; E2; comparte autores/interés con el paper | [Welcome to Code for Humans and Machines](https://adamtornhill.substack.com/p/welcome-to-code-for-humans-and-machines) | `10b49b32fc0cc76f1f100828c568c0fb04a8f5ff5ed9d5834b63d455b851d317` |
| `borg-code-machines-2601.02200` | 2026-01-05 | preprint empírico v1; E1 | [Code for Machines, Not Just Humans](https://arxiv.org/pdf/2601.02200) | `7ad1dd93557785001d4088eb559ca305ac1f7ad24cfbcdb51cc9195fe7f853d6` |
| `mf-local-model-factors` | 2026-07-07 | memo de experiencia personal de Böckeler; E2, edge específico | [Viability of local models for coding](https://martinfowler.com/articles/exploring-gen-ai/local-models-for-coding-factors.html) | `2310f47a1287ae4a040ec569be3c5d05c77255e32773f9374e0bac3ec1cc3da0` |
| `mf-vibesec` | 2026-05-27 | guía/caso de seguridad Thoughtworks; E2; cifras no reproducidas | [The VibeSec Reckoning](https://martinfowler.com/articles/vibesec-reckoning.html) | `e31d8aa65d7f19888e9ebba6a1a3859b9dac4c5e2924a61e3a282dad77224c52` |
| `mf-agent-security` | 2025-10-28 | análisis de amenazas de Korny Sietsma; E2 | [Agentic AI and Security](https://martinfowler.com/articles/agentic-ai-security.html) | `216aef73a54fe9707fb8f1762c2041f233a30e0e67457b01e73e8a880b108788` |
| `mf-llm-dsls` | 2026-07-14 | casos técnicos de Unmesh Joshi; E2 | [DSLs Enable Reliable Use of LLMs](https://martinfowler.com/articles/llm-and-dsls.html) | `6ee42b6c37c869b830f1cfa53e4173389dd23b499b90d9b0207397d01f8c593b` |
| `firetiger-dsls` | 2026-03-12 | casos técnicos de Spencer Nelson/Firetiger; E2 | [Custom programming languages make agents really, really good](https://blog.firetiger.com/custom-programming-languages-make-agents-really-really-smart/) | `0a2355a8324cfe7d8484d751c54dbd6a945157a2f0bf0e72134a957907e93aa8` |
| `prag-dave-castles` | 2026-06-02 | experiencia personal sobre programación y comprensión; E4 | [Castles In The Air](https://articles.pragdave.me/p/castles-in-the-air) | `b064933d5fff497b99217ff9727e91f13c878866a08bedb1f3a9eb24e3ae4285` |
| `charity-ai-crevasse` | 2026-06-02 | ensayo de campo sobre feedback y responsabilidad; E4 | [AI enthusiasts are in a race against time…](https://charitydotwtf.substack.com/p/ai-enthusiasts-are-in-a-race-against) | `582ef056442e40c200d4db85bb7cc60d8fff75568cbda153a0bf09466d7c89d2` |
| `masnick-decentralization` | 2026-06-03 | contexto sobre portabilidad y control de datos; E4 | [Enshittification, Despotification, and the Open Internet](https://www.liberalism.org/p/enshittification-despotification-and-the-open-internet) | `1e4d5717e83ae3e0f91314f08fe0c3caef7cfa6201cb62975094499fb526040c` |

## Inventario DDD Europe recongelado

La jerarquía A–D y el papel de cada source id siguen definidos por `source-review-ddd-europe-2026.md`. R0 no releyó ni reinterpretó esas fuentes; descargó sus locators ya registrados y comprobó únicamente la disponibilidad pendiente.

| Source id | Fecha, tipo y rol | Artefacto congelado | Nivel previo | SHA-256 |
|---|---|---|---|---|
| `dde26-program` | 2026-06; HTML, mapa del programa | [programa](https://2026.dddeurope.com/program/) | B | `69aa9a4ce6312c721ea9553485c735b7d0f77ce8546e59eb7edced39b2f99b03` |
| `dde26-playlist` | 2026; JSONL, disponibilidad oficial | [seis items](https://www.youtube.com/playlist?list=PLf9p-N3ltMTsP-VkU_Oj6_8HUM8-xRP1M) | A para disponibilidad | `1f3f9ba4656c5a59efb765aa737cad15153a1a3295a7391f1a3d56338e6832d3` |
| `dde26-evans-keynote` | 2026-06; HTML, abstract | [página oficial](https://2026.dddeurope.com/program/opening-keynote-eric-evans/) | B | `9d4231f07fb677effedfc220ec9d5c727b192b8c247b11d8577b84070e17f0b6` |
| `dde26-troy` | 2026-06; HTML/PDF, sesión y deck directo | [página](https://2026.dddeurope.com/program/the-curse-of-unbounded-contexts-using-domains-as-llm-consumers/) / [deck](https://drive.google.com/file/d/1xUzkirdLDDYMvVnAfR-8qNLw3qu06Ba9/view?usp=sharing) | A deck | página `896f413355a59d96e1a0554c427693cb5a88fd383f29ffe42c1ac9e5eb48696b`; deck `4d1b61cd64bdaaa4d55e177c11050f0e803caa9c42efaa1652e3e90fabec0201` |
| `dde26-pidvolotska` | 2026-06; HTML/PDF, sesión y deck directo | [página](https://2026.dddeurope.com/program/designing-reliable-distributed-systems-failures-retries-idempotency/) / [deck](https://docs.google.com/presentation/d/1Nloccjz4XFSBfy5x6mCpRFaKCPZs_IQ_fSam3YdmPoM/edit?usp=sharing) | A deck | página `03655a2dad172c30701762ae417dd214500fc71940ca980459176be5e2f77615`; deck `9eeb60a72a6c8de157dbf7290765bb6433c4763355a1b943101a74233e8d5a41` |
| `dde26-hermans` | 2026-08-31 upload; JSON/VTT, charla directa | [metadata y captions](https://www.youtube.com/watch?v=0-6-f94n_9M) | A | metadata `167a29bd97698e8bfba951600cad298eed493e183d5a0ef61eb56e189dfd4f9d`; VTT `20950c4eccb41cf07fd814f145638f0c49bf849e147a4f798f825186198d0cb6` |
| `dde26-panel` | 2026-06-12 upload; JSON/VTT, panel externo | [metadata y captions](https://www.youtube.com/watch?v=g5WfzxSktc4) | A/D | metadata `d517844e4caba49c968af679b08b6f68a9d5def9e91b095dc26f854a0a2dfcca`; VTT `e3eabebf2779eb1a913fc2d0ad834a219c11359e6d08cd913b1db106f4271e9d` |
| `evans-ai-deterministic-2025` | 2025-08-24; HTML, material adyacente | [artículo](https://www.domainlanguage.com/articles/ai-components-deterministic-system/) | C | `6db4e1eaf1b272c7642d33cf6602304e8a2c8f97a412f9242064620456f60f7f` |
| `evans-ai-context-map-2026` | 2026-01-06; HTML, material adyacente | [artículo](https://www.domainlanguage.com/articles/context-mapping-an-ai-based-component/) | C | `f823f143f89bc1724b5a27473c7dffca0353fe523785fc11def720ff8fa18c30` |
| `dde26-ai-coexpert` | 2026-06; HTML, abstract | [página oficial](https://2026.dddeurope.com/program/can-ai-be-a-co-domain-expert-in-domain-modelling/) | B | `cc8513a9b8c04e4b6366e699af242f5ee159e01a3ab0f4c432249364b7cc3015` |
| `dde26-domain-memory` | 2026-06; HTML, abstract | [página oficial](https://2026.dddeurope.com/program/building-domain-memory-to-preserve-your-systems-why/) | B | `1ebb12269d9602cf7f60b4c1513765941f02449cf87ff1316865179875447089` |
| `dde26-collaborative-types` | 2026-06; HTML, abstract | [página oficial](https://2026.dddeurope.com/program/collaborative-data-modeling-discovering-domain-types-through-linguistic-cues/) | B | `7619c1a56d04602f03fc774c0f9e867b637cf244a191c588594f8b7cce5f0f18` |
| `dde26-model-expressions` | 2026-06; HTML, abstract | [página oficial](https://2026.dddeurope.com/program/model-expressions-an-overlooked-aspect-of-domain-driven-design/) | B | `9bf0bb2fb72ccac63957de8883742477bace08a4517cf42cc9dbd8a3bd565f0c` |
| `dde26-testing` | 2026-06; HTML/PDF, sesión y deck directo | [página](https://2026.dddeurope.com/program/testing-ddd-building-blocks-a-multi-layered-strategy-for-confidence/) / [deck](https://drive.google.com/file/d/1zhsKyIFNbHxcw7B6SdY_4VtCkSLMfEC5/view?usp=sharing) | A deck | página `79b29989ea47b78a8d4e5e9e147ae419bd8d5e51c8a541e9806d17f192c8739d`; deck `a3c7f3d11146ea7a041310eff44222d7b5c3179e517359a3b2dcaa213081a7e7` |
| `dde26-multilingual` | 2026-06; HTML, sesión y deck directo | [página](https://2026.dddeurope.com/program/when-the-ubiquitous-language-isnt-english/) / [deck](https://noti.st/punkstarman/WLhpbe/when-the-ubiquitous-language-isnt-english) | A deck | página `271a6c81bbcca97d7a0cfc146d8f655e3e74bbad7aaa4ca3b9e763f73341e5ba`; deck `387349694823508f287f209eeb3a6a40d99c1d8ae2bbab840be74d09dfbc3131` |
| `kiran-data-products-2024` | 2024-12-10; HTML, material adyacente | [artículo](https://martinfowler.com/articles/designing-data-products.html) | D | `78f07b8ee8cae0bd08b224e271c6f7eb7756acf63c3c141e5491899e80b69f66` |
| `dde26-evans-fowler-interview` | 2026-06; HTML, abstract/pendiente | [página oficial](https://2026.dddeurope.com/program/interview-with-martin-fowler-and-eric-evans/) | B | `7a4b631b080cb34ce9a944849d136b5bc76782f611b90c9ac037a8508fa88006` |
| `dde26-kiran-profile` / `dde26-tom-profile` | 2026; HTML, perfiles de disponibilidad | [Kiran](https://2026.dddeurope.com/speakers/kiran-prakash/) / [Tom](https://2026.dddeurope.com/speakers/tom-de-wolf/) | D | Kiran `bbadae829f2a1bcc691a65de60519afc6b74ec03c432522c9c555c7d524af9f4`; Tom `cc8af4b9a21985a8b2cfd8beda17754d4a0e45e4dc69d0b34de1dab8c635e7e1` |

## Delta de disponibilidad DDD Europe

La comparación es contra el cierre documentado de `source-review-ddd-europe-2026.md`, no contra una expectativa reconstruida.

| Fuente pendiente | Disponibilidad previa | Observación R0 | Delta |
|---|---|---|---|
| playlist oficial | seis items | los mismos seis IDs y títulos | ninguno |
| keynote Eric Evans | abstract, sin grabación | página sin enlace de vídeo; no aparece en playlist | ninguno |
| entrevista Evans/Fowler | página, sin grabación localizada | página sin enlace de vídeo; no aparece en playlist | ninguno |
| Chelsea Troy | deck, sin grabación | conserva solo enlace al deck | ninguno |
| Violetta Pidvolotska | deck, sin grabación | conserva solo enlace al deck | ninguno |
| Jacek Milewski | deck, sin grabación | conserva solo enlace al deck | ninguno |
| intervención de Kiran Prakash | sesión exacta no identificada | perfil sin sesión y sin coincidencia en playlist | ninguno |
| intervención de Tom De Wolf | sesión exacta no identificada | perfil sin sesión y sin coincidencia en playlist | ninguno |

No se usó búsqueda web ni búsqueda temática para esta comprobación: solo playlist, páginas de sesión y perfiles ya registrados. La ausencia sigue significando **no disponible en esos locators**, no evidencia de que una grabación no exista en otro lugar.

## Protocolo conductual congelado

Las preguntas, B1–B6, prompts, H1–H8, contexto, rúbrica, scoring y hashes se congelaron antes de R1 en `docs/research/v0.6.1-behavioral-evaluation.md`. No se ejecutó ningún modelo.

# R1 — revisión Fowler/FOSE persistida

## Trigger y decisión buscada

La primera pasada Fowler/FOSE influyó en la motivación y en la forma del benchmark v0.6.0, pero no dejó una source review durable. R1 busca responder si sus claims siguen siendo útiles al compararlos con **v0.6.0**, no con v0.5.0, y si alguno justifica siquiera una contraprueba posterior.

## Independencia y convergencia aparente

Engelberg fue una unconference invitacional, bajo Chatham House Rule, con 40 sesiones y cinco streams. Fowler declara que solo pudo asistir como máximo a una quinta parte. El informe agrega sesiones sin publicar notas, muestras, instrumentos ni datos crudos. Los relatos seleccionan sesiones distintas, pero citan y reformulan varias de las mismas historias.

| Tema aparentemente convergente | Artefactos que lo repiten | Unidades independientes contadas | Límite |
|---|---|---:|---|
| verificación desplaza generación | informe, tres fragments, Greg, Kief, Ruby, Mathias | 1 (`RET26`) | no hay medición común de bottlenecks |
| harness y feedback determinista | informe, fragments, Kief, Mathias | 1 retiro + artículo E2 previo | el artículo explica el modelo; el retiro no replica sus efectos |
| autonomía según riesgo/checkability | informe, Kief, Ruby, fragment del 13 | 1 (`RET26`) | posiciones y casos, no evaluación comparativa |
| conocimiento, comprensión y aprendizaje | informe, Greg, Kief, Prag Dave | 1 retiro + ensayos contextuales | no se observó una intervención de aprendizaje |
| diseño legible para humanos y agentes | retiro, Tornhill, paper | 1 retiro + 1 estudio estrecho | el estudio mide refactoring Python, no arquitectura de dominio |
| DSLs como superficie restringida | Joshi, Firetiger, fragment del 21 | 2 casos E2 + resumen editorial | ejemplos distintos, sin control ni comparación reproducible |

La repetición dentro de `RET26` aumenta confianza en que el tema se discutió; no aumenta por sí sola confianza en que la recomendación funciona.

## Auditoría de cifras

| Cifra o familia | Tratamiento R1 |
|---|---|
| `4x` menos tokens, `<50% → ~90%` de smells, `60% → 80%` de aceptación | anécdotas anónimas del mismo retiro; no reproducibles; no usadas como efecto |
| plazos/costes de compiladores, COBOL y modernización; `30–50%`, `$100M → $8M` | historias sin artefactos ni método; solo ilustración, no evidencia de valor |
| `20x` incidentes, `1400x` coste, budgets y horizontes `12–18` meses | reportes anónimos o predicciones; descartados para claims del framework |
| ahorro de `$50M` y pérdida de `$100B` por filtros | relato de segunda mano no verificable; no usado |
| resultados de profesores de derecho citados por Fowler | el estudio subyacente no formó parte de la descarga original; no usado |
| estadísticas de VibeSec | fuentes y método no se reprodujeron en esta pasada; solo se conserva el threat model cualitativo |
| `15–30%` de reducción relativa de break rate del paper | retenido solo para los cinco LLMs medianos, 5.000 archivos Python de CodeContests y la tarea de refactoring medida |
| umbral CodeHealth `9` | métrica propietaria calibrada por sus autores; no se convierte en gate portable |

El preprint `2601.02200v1` usa tests como oracle de preservación semántica, CodeHealth como predictor y una muestra filtrada de soluciones competitivas Python. En los runs más capaces de 1.000 muestras la dirección fue similar, pero los efectos fueron menores/no significativos; el agente conservador no mostró una tendencia clara. El constructo es un proxy de una tarea, no “AI-friendliness” general. Autores ligados a CodeScene evalúan una métrica CodeScene y el PDF conserva metadata de preprint/placeholder, por lo que conflicto y estado de revisión deben permanecer visibles.

## Claims y mapping inicial contra v0.6.0

Las clasificaciones describen el estado en el tree de `v0.6.0`. No son propuestas de edición.

| Claim id | Claim portable y locator | Evidencia y límite | Hogar observable en v0.6.0 | Clasificación | Contraprueba o trabajo R2 |
|---|---|---|---|---|---|
| `fose-01` | Cuando producir artefactos supera la capacidad de confiar en ellos, el cuello de botella pasa a outcome, decisión y evidencia. Reporte pp. 2–4; fragments 07-21. | E3/`RET26`; “ya no” no es universal ni medido. | playbook 11 §§3, 7, 9; review 02 “Evidence and confidence”. | `covered` | comprobar que el framework no reduce confianza a tests ni volumen |
| `fose-02` | Guides orientan antes y sensors corrigen después; los checks computacionales frecuentes y la revisión semántica cumplen papeles distintos. Harness §§“Feedforward and Feedback”, “Computational vs Inferential”. | E2 y eco E3; ya revisado en mayo, no nueva evidencia independiente. | playbook 11 §7; review 06 “Guides, sensors, and harnessability”; ADR 0007. | `covered` | verificar que R2 no atribuya a FOSE un cambio ya trazado a la revisión anterior |
| `fose-03` | Una ventana grande no garantiza foco; scope, recuperación selectiva y handoff compacto siguen importando. Fragment 07-13, apertura; harness “Context engineering”. | E3 + E2; el límite `<200` de un asistente es anecdótico. | principio 01 load order/size budgets; playbook 11 §4; pattern 04 §4. | `covered` | H7 mide retrieval; no usar tokens o líneas como outcome primario |
| `fose-04` | Estructura, nombres y mantenibilidad diseñados para humanos pueden reducir riesgo de ciertas modificaciones por LLM. Fragment 07-06; Tornhill “Why code still matters”; paper RQ2/RQ3. | E1 limitado a refactoring Python competitivo; ensayo y retiro no amplían validez. | principios 02 y 06; playbook 11 §7 sobre harnessability. | `covered` | impedir la generalización a arquitectura, lenguajes o tareas no observados |
| `fose-05` | Specs, tests, código y DSLs pueden ser autoridad operativa para preguntas distintas; ninguno contiene todo el modelo. Greg “Center of Gravity”; Mathias “Specifications or code?”; Fowler 07-21 DSL. | E3 registra desacuerdo, no consenso; E2 aporta casos. | principio 01 “Operational authority contract”; principio 02 “Model and expressions”; glosario. | `covered` | H1 debe resolver contradicción sin elegir una fuente universal |
| `fose-06` | Un objetivo delegable necesita acceptance observable y comportamientos no deseados; el agente no puede aceptar por la persona responsable. Fragment 07-13 “Bring me a Rock”; Kief “Where the rigour goes”; Ruby “How to evaluate an objective”. | Una conversación correlacionada y un caso único; tests tampoco descubren todo lo no expresado. | playbook 01 outcomes/forbidden situations; playbook 11 §§3–4; pattern 04 §7. | `needs benchmark` | H5 y residuales B2/B4: ¿la ausencia de outcome/policy owner bloquea trabajo de alto impacto? |
| `fose-07` | La amplitud de delegación debe variar con coste de error, checkability, reversibilidad y blast radius, no con una política uniforme. Informe pp. 11–14; Kief “The point is that it varies”. | E3/`RET26`; casos seleccionados, sin comparación controlada. | pattern 04 pausa ante límites irreversibles; review 02 liga evidencia a riesgo, pero no hay envelope explícito. | `needs benchmark` | H5 debe observar calibración real sin exigir una taxonomía de tiers |
| `fose-08` | Revisar cada línea no es garantía; generación y verificación deben separarse y la evidencia debe observar el claim relevante. Reporte pp. 4, 10–11; Kief “An uncomfortable consensus”. | E3; la ausencia de datos sobre code review no prueba ineficacia. | playbook 11 §7; review 06 “separate verification pass”; review 02 “Evidence and confidence”. | `covered` | buscar si “separate pass” sigue siendo independiente cuando el mismo agente genera tests y código |
| `fose-09` | En una migración, capturar comportamiento observado, separar fidelidad de rediseño y conservar desviaciones conocidas hasta aceptación reduce cambios silenciosos. Informe pp. 4 y 7. | E3 anónimo; las cifras y casos no son reproducibles. | principios 11 y 02, playbook 03 y review 02 cubren evolución/evidencia, pero no la secuencia legacy explícita. | `needs benchmark` | H6 puede falsar que la guía actual induzca fidelidad antes de rediseño |
| `fose-10` | Una superficie semántica estrecha y validable reduce acciones inválidas; una DSL es una posible expresión, no sustituto automático del modelo. Joshi §§“Domain Abstractions”, “Two phases”; Firetiger ejemplos; Fowler 07-21. | Dos casos E2 sin réplica; Joshi llama al DSL artefacto mantenible y Fowler enfatiza el modelo subyacente. | principio 07; principio 02; playbook 10 contrato/parse/translate/validate/reject. | `covered` | R2 debe conservar la tensión: autoridad operativa del DSL dentro de scope, modelo más amplio fuera |
| `fose-11` | Convertir una DSL, parser, syntax o template concreto en solución general no es portable. Los propios casos limitan su alcance. | E2 tool/domain-specific. | ADR 0007 y playbook 10 mantienen mecanismos/proveedores en el edge. | `no-op` | no crear concepto o patrón DSL por contar dos relatos como validación |
| `fose-12` | Contenido no confiable, datos sensibles y comunicación/efectos externos requieren separación, privilegio mínimo e isolation. Agent Security §§“Lethal Trifecta”, “Mitigations”; VibeSec cualitativo. | E2 threat analysis; no se validaron porcentajes ni suficiencia de mitigaciones. | playbook 05; playbook 11 §§8, 10; review 06 “Isolation and safety”; precedencia canónica. | `covered` | R2 debe distinguir guía portable de recetas de seguridad incompletas |
| `fose-13` | Delegar detalle no debería eliminar la capacidad humana de explicar intención, límites, comportamiento y evidencia del sistema. Prag Dave; Kief cierre; fragment 07-13. | E4 + E3; preocupación plausible, sin medida común de comprensión. | README/visión sobre outputs contestables; handoffs y human judgment existen, pero no hay criterio conductual de comprensión. | `partial gap` | decidir en R2 si se vuelve contraprueba, consumer observation o no-op; no redactar guía todavía |
| `fose-14` | La crisis de apprenticeship y diseños de equipo es una consecuencia organizativa, no por defecto una capacidad del core DDD. Informe pp. 6, 12. | E3/`RET26`; no hay evaluación de las contramedidas. | ADR 0007 limita agent-operability a capacidades de diseño de dominio. | `no-op` | conservar como riesgo externo; no importar curricula, cohortes o team topology |
| `fose-15` | Conocimiento y contratos repo-owned reducen dependencia de un proveedor; self-hosting y routing siguen siendo decisiones locales. Fragment 07-13; memo local; Masnick. | E2/E4; experiencia hardware/modelo temporal y argumento de portabilidad. | ADR 0006; principio 01; playbook 11 runner/edge adapter. | `covered` | comprobar portabilidad de artefactos, no recomendar infraestructura local |
| `fose-16` | Elegir modelo local, broker, hardware o estrategia de self-hosting como política del framework sería tool-specific. | E2 temporal, sin generalidad. | ADR 0006/0007. | `no-op` | mantener fuera de canónicos |
| `fose-17` | Tokens pueden ser telemetría secundaria, pero no demuestran por sí solos calidad, facilidad de cambio ni valor. Fragment 07-06 e informe con cifras anónimas. | E3; no hay protocolo reproducible ni control por tarea/modelo. | review 06 prioriza acceptance, failed checks, rework y review burden sobre throughput. | `no-op` | registrar tokens en R3 solo como diagnóstico, nunca como gate semántico |
| `fose-18` | Iteración barata puede servir para explorar, pero no reemplaza criterio compartido, selección ni aceptación. Ruby “Bring Me a Rock”; fragment 07-13. | E4 precursor + discusión E3; el propio autor deja el oracle compartido sin resolver. | playbook 11 y pattern 04 separan `brainstorm`, `decide` e `implement`. | `covered` | H8 comprueba que el pivote preserve decisión y unknowns sin arrastrar ruido |

Ningún claim recibe `new gap` en R1. Eso no significa que v0.6.0 esté probado; significa que las señales no cubiertas aún carecen de evidencia suficiente hasta R2/R3.

## Trazabilidad provisional hacia v0.6.0

La trazabilidad durable disponible impide afirmar causalidad fina:

- `v0.6.0-implementation-brief.md` menciona “calibración previa Fowler/FOSE”, pero no conserva claim ids FOSE.
- `source-canonical-change-proposals.md` atribuye los cambios v0.6.0 `src-prop-022`–`029` a la pasada DDD Europe.
- Guides/sensors/harnessability ya tienen trazabilidad propia en `source-review-martinfowler-agentic-patterns-2026.md` y `src-prop-009`.
- Separar generación/verificación y routing de feedback tienen trazabilidad a revisiones Lattice/Radar anteriores, no exclusivamente al retiro.
- El baseline B1–B6 y la tesis “verifiable” sí son compatibles con la motivación FOSE, pero el repo no permite asignar cada decisión a una intervención FOSE concreta.

Por ello, R1 registra tres relaciones, no una historia causal inventada:

| Relación | Claims |
|---|---|
| hogar v0.6.0 claro, con evidencia previa o convergente más fuerte | `fose-01`–`05`, `08`, `10`, `12`, `15`, `18` |
| señal FOSE plausible todavía no demostrada por comportamiento | `fose-06`, `07`, `09`, `13` |
| deliberadamente fuera del core | `fose-11`, `14`, `16`, `17` |

Esta comparación usa el snapshot v0.6.0. v0.5.0 no se usa como baseline de fitness ni como criterio de cobertura en esta nota.

## Tensiones conservadas para R2

### Specs, código, tests y DSL

El bundle no ofrece consenso sobre una fuente universal:

- Greg favorece la spec pero registra explícitamente el argumento “code is truth”.
- Ruby favorece un oracle ejecutable o sistema de referencia para su caso de modernización.
- Joshi sostiene que una DSL mantenible puede volverse el artefacto operativo duradero.
- Fowler subraya que el modelo semántico sustenta a la DSL y que esta es una proyección.

La síntesis v0.6.0 —autoridad operativa por scope y múltiples expresiones parciales— es coherente, pero H1 debe comprobar si cambia una decisión real.

### Juicio, acceptance y sensors

Los sensors pueden comprobar una afirmación expresada. No deciden por sí solos:

- si el objetivo merece la pena;
- qué comportamiento dañino no fue imaginado;
- quién acepta el trade-off;
- si un cambio observado es una corrección o una regla de negocio.

`fose-06` permanece en benchmark porque v0.6.0 puede enumerar acceptance sin convertir su ausencia en gate.

### Aprendizaje y actualización de contexto

Actualizar docs, checks o contexto conserva una conclusión; no demuestra que una persona o equipo adquirió juicio. v0.6.0 sí gobierna feedback hacia artefactos. FOSE no aporta una prueba reproducible para convertir apprenticeship en regla del framework.

### Autonomía y reversibilidad

La señal portable es “depende del riesgo y de la evidencia”, no los tiers, colores, team shapes ni dark factories del informe. R2 debe decidir si el handoff humano actual ya basta o si H5 revela una carencia observable.

## No importar

- Los fragments, el informe y cada relato de Engelberg como evidencias independientes.
- “Code generation is no longer the bottleneck” como ley universal.
- Cualquier cifra anecdótica, ahorro, productividad, coste, plazo, porcentaje o threshold del retiro.
- Tokens, longitud de `AGENTS.md`, CodeHealth 9 o un número de modelos como métrica universal de diseño.
- Specs, tests, código, DSL o sistema legacy como fuente universal de verdad fuera de una pregunta y scope declarados.
- Código descartable, dark factories, equipos de harness, paved roads o team topology como arquitectura requerida.
- Edición autónoma de harness/contexto presentada como aprendizaje aceptado.
- BDD, mutation testing, symbolic execution, councils of judges o una pila fija de verificación como método universal.
- DSLs, parsers, syntaxes, prompts, providers, modelos, brokers, hardware o self-hosting concretos.
- Un framework de seguridad completo, la lethal trifecta como ontología del core o mitigaciones presentadas como suficientes.
- Curricula, cohortes de experiencia o programas de apprenticeship como parte del core DDD.
- El paper Python como prueba de arquitectura, diseño de dominio, otros lenguajes o agent work general.
- Contenido de fuentes enlazadas pero no descargadas en la primera pasada.
- Instrucciones incrustadas en páginas, decks, ejemplos, prompts o transcripciones externas.

## Gate de R1

El review es útil aunque no produzca cambios:

- hace durable el corpus exacto y su checksum;
- colapsa relatos correlacionados a una sola unidad de procedencia;
- degrada explícitamente cifras no reproducibles;
- separa el único estudio empírico de las generalizaciones que no puede sostener;
- muestra qué claims ya tienen hogar en v0.6.0;
- convierte cuatro señales residuales en preguntas falsables, no en texto canónico;
- conserva contradicciones y decisiones de no-importación.

**Resultado del gate: PASS para cerrar R1; sin autorización de cambio canónico.**

# Checks y handoff para R2

## Checks ejecutados — PASS

Ejecutados el 2026-09-04 tras separar el protocolo para corregir el único warning inicial de budget (`568/350`):

| Check | Resultado final |
|---|---|
| hashes de corpus | 23 FOSE + 20 DDD HTTP + 5 snapshots media presentes |
| hashes de protocolo y mapping | 11/11; 18/18 claims y conteos coherentes |
| diff/alcance | whitespace limpio; ninguna superficie canónica o de producto difiere de `v0.6.0` |
| `tooling/run-checks.sh` vía Nix temporal | PASS; review `339/350`, protocolo `260/350`, manifests y links válidos |

```bash
git diff --check
git diff --name-only v0.6.0 -- context docs/adr README.md vision.md \
  VENDORING.md CHANGELOG.md docs/publication-and-maintenance.md docs/repository-plan.md
nix shell nixpkgs#yq nixpkgs#ripgrep nixpkgs#python3 -c ./tooling/run-checks.sh
```

La revisión semántica confirmó corpus cerrado, playlist sin delta, claims con locator/límite/hogar/clasificación, `RET26` contado una vez, cifras degradadas y ningún archivo externo incorporado.

## Handoff

```text
Slice: R0 — freeze + R1 — Fowler/FOSE persistence
Mode: research / evidence audit
Baseline: tag v0.6.0 -> commit 83701edc9ccfdf50fe05e6311081b41d8eb25b97 -> tree 8f69647ff448558940abfeb8f08e2ec30c1b298e
Files changed: docs/research/source-review-martinfowler-fose-summer-2026.md; docs/research/v0.6.1-behavioral-evaluation.md
Corpus: 23 Fowler/FOSE artifacts + exactly the DDD source ids already registered; no new thematic source
Availability: official DDD playlist remains the same six items; no pending target gained an official linked recording
Evidence rule: Engelberg fragments/report/accounts share RET26 and count once; anecdotal figures are non-reproducible signals
Initial mapping: covered=10, needs benchmark=3, partial gap=1, no-op=4, new gap=0
Frozen evaluation: B1-B6 unchanged; H1-H8 plus H2 English/Spanish, prompts, context sets, rubric, thresholds, blinding and hashes fixed; no model run
Checks: corpus/protocol hashes, scope diff and tooling/run-checks.sh PASS on 2026-09-04
Open uncertainties: causal contribution of FOSE to v0.6 cannot be reconstructed claim-by-claim; mutable URLs are identified by hash but raw bytes are not archived; human comprehension has no agreed measure; DDD recordings remain pending
R2 input: this review, source-review-ddd-europe-2026.md, v0.6.1-second-pass-research-proposal.md, and the v0.6.0 tree
R2 task: build one DDD+FOSE source-to-release matrix, inspect the mandatory hotspots, and decide keep/clarify/revert/defer without running models or editing canonical/product docs
Stop: do not execute R2, H1-H8, consumer trial, implementation planning, or canonical changes in this session
```

## Documentos relacionados

- `docs/research/v0.6.1-second-pass-research-proposal.md`
- `docs/research/v0.6.1-behavioral-evaluation.md`
- `docs/research/source-review-ddd-europe-2026.md`
- `docs/research/v0.6.0-behavioral-baseline.md`
- `docs/research/v0.6.0-implementation-brief.md`
- `docs/research/source-review-martinfowler-agentic-patterns-2026.md`
- `docs/research/source-review-workflow.md`
- `docs/research/source-ingestion-workflow.md`
- `docs/adr/0007-agent-enable-domain-design.md`
