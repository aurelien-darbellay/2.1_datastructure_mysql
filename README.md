# 2.1_DataStructure_MySQL

## Nivell 1

### Exercici 1 - Òptica
Una òptica, anomenada **"Cul d'Ampolla"**, vol informatitzar la gestió dels clients/es i vendes d'ulleres.

En primer lloc, l'òptica vol saber quin és el proveïdor de cadascuna de les ulleres. En concret vol saber de cada proveïdor:
- **Nom**
- **Adreça** (carrer, número, pis, porta, ciutat, codi postal i país)
- **Telèfon**
- **Fax**
- **NIF**

La política de compres de l'òptica es basa en que les ulleres d'una marca es compraran a un únic proveïdor (així en podrà treure millors preus), però poden comprar ulleres de diverses marques a un mateix proveïdor. De les ulleres vol saber:
- **Marca**
- **Graduació de cadascun dels vidres**
- **Tipus de muntura** (flotant, pasta o metàl·lica)
- **Color de la muntura**
- **Color de cada vidre**
- **Preu**

Dels clients/es vol emmagatzemar:
- **Nom**
- **Adreça postal**
- **Telèfon**
- **Correu electrònic**
- **Data de registre**
- Quan arriba un/a client/a nou, emmagatzemar qui li ha recomanat l'establiment (si algú ho ha fet).

El sistema haurà d’indicar **qui ha sigut l’empleat/da que ha venut cada ullera**.

---

### Exercici 2 - Pizzeria
T’han contractat per dissenyar una web que permeti fer comandes de menjar a domicili per Internet.

Tingues en compte les següents indicacions per modelar la base de dades:

#### **Clients**
Cada client/a té:
- **Identificador únic**
- **Nom i cognoms**
- **Adreça**
- **Codi postal**
- **Localitat**
- **Província**
- **Número de telèfon**

Les dades de **localitat** i **província** es guarden en taules separades:
- Una **localitat** pertany a una única província.
- Una **província** pot tenir moltes localitats.

#### **Comandes**
- Un/a client/a pot fer **moltes comandes**, però **una comanda pertany a un únic client**.
- Cada comanda té:
  - **Identificador únic**
  - **Data/hora**
  - **Tipus de comanda** (a domicili o recollida en botiga)
  - **Quantitat de productes seleccionats**
  - **Preu total**
  - **Productes** (pizzes, hamburgueses i begudes)

#### **Productes**
Cada producte té:
- **Identificador únic**
- **Nom**
- **Descripció**
- **Imatge**
- **Preu**

Les **pizzes** poden pertànyer a diverses **categories**, que poden canviar al llarg de l'any:
- Una **pizza** només pot estar en **una categoria**.
- Una **categoria** pot tenir **moltes pizzes**.

Cada **categoria** té:
- **Identificador únic**
- **Nom**

#### **Botigues i empleats**
- Una **comanda** és gestionada per una única **botiga**, però una **botiga** pot gestionar moltes comandes.
- Cada botiga té:
  - **Identificador únic**
  - **Adreça**
  - **Codi postal**
  - **Localitat**
  - **Província**
- A cada **botiga** poden treballar **molts empleats**, però un **empleat** només pot treballar en una botiga.
- Cada **empleat** té:
  - **Identificador únic**
  - **Nom i cognoms**
  - **NIF**
  - **Telèfon**
  - **Rol** (cuiner/a o repartidor/a)
  - Per a comandes a domicili, es guarda **quin repartidor** ha fet el lliurament i la seva **data/hora**.

---

## Nivell 2

### Exercici 1 - YouTube
Creació d'un model de base de dades per a una versió reduïda de YouTube.

#### **Usuaris**
Cada usuari/ària té:
- **Identificador únic**
- **Email**
- **Password**
- **Nom d'usuari/ària**
- **Data de naixement**
- **Sexe**
- **País**
- **Codi postal**

#### **Vídeos**
Cada vídeo té:
- **Identificador únic**
- **Títol**
- **Descripció**
- **Grandària**
- **Nom de l'arxiu de vídeo**
- **Durada**
- **Thumbnail**
- **Nombre de reproduccions**
- **Número de likes i dislikes**
- **Estat** (públic, ocult o privat)
- **Etiquetes** (cada etiqueta té un identificador únic i nom)

Es guarda **qui ha publicat el vídeo** i en **quina data/hora**.

#### **Canals**
Un usuari/ària pot crear **un canal**, amb:
- **Identificador únic**
- **Nom**
- **Descripció**
- **Data de creació**

Els usuaris/es poden:
- **Subscriure's** als canals d'altres usuaris.
- **Donar likes o dislikes** als vídeos (només una vegada per vídeo).
- **Crear playlists** (públiques o privades) amb:
  - **Identificador únic**
  - **Nom**
  - **Data de creació**

#### **Comentaris**
- Els usuaris/es poden **escriure comentaris** als vídeos.
- Cada comentari té:
  - **Identificador únic**
  - **Text**
  - **Data/hora**
- Els comentaris es poden **marcar com "m'agrada" o "no m'agrada"**.

---

## Nivell 3

### Exercici 1 - Spotify
Model senzill de la base de dades de Spotify.

#### **Usuaris**
Hi ha dos tipus d'usuaris: **free** i **prèmium**. Cada usuari/ària té:
- **Identificador únic**
- **Email**
- **Password**
- **Nom d'usuari/ària**
- **Data de naixement**
- **Sexe**
- **País**
- **Codi postal**

#### **Subscripcions (Usuaris Prèmium)**
Cada subscripció conté:
- **Data d'inici**
- **Data de renovació**
- **Forma de pagament** (targeta de crèdit o PayPal)
- **Pagaments realitzats**, on es guarda:
  - **Data**
  - **Número d'ordre únic**
  - **Total pagat**

#### **Playlists**
Cada usuari pot tenir **moltes playlists**, cadascuna amb:
- **Identificador únic**
- **Títol**
- **Nombre de cançons**
- **Data de creació**
- **Estat** (activa o esborrada)

Quan una playlist s'esborra, només es marca com a eliminada (sense eliminar-la del sistema).

#### **Cançons i Àlbums**
- Una **cançó** només pertany a **un àlbum**.
- Un **àlbum** pot contenir **moltes cançons**.
- Un **àlbum** ha estat publicat per un **únic artista**.
- Un **artista** pot tenir **molts àlbums**.

Cada **cançó** té:
- **Identificador únic**
- **Títol**
- **Durada**
- **Nombre de reproduccions**

Cada **àlbum** té:
- **Identificador únic**
- **Títol**
- **Any de publicació**
- **Imatge de portada**

Cada **artista** té:
- **Identificador únic**
- **Nom**
- **Imatge**

Els usuaris poden:
- **Seguir artistes**
- **Veure artistes relacionats**
- **Marcar àlbums i cançons com a favorites**

