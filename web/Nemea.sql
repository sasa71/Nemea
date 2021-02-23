-- username: root
-- password: root
DROP DATABASE IF EXISTS `Nemea`;
CREATE DATABASE IF NOT EXISTS `Nemea`;
USE `Nemea`;

CREATE TABLE `utente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `passwordhash` char(40) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `admin` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`username`),
  UNIQUE KEY (`email`)
);

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `descrizione` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `prodotto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `descrizione` longtext NOT NULL,
  `prezzoCent` bigint(20) NOT NULL,
  `images` varchar(50),
  PRIMARY KEY (`id`),
  FULLTEXT KEY (`nome`),
  FULLTEXT KEY (`nome`,`descrizione`)
);

CREATE TABLE `prodotto_categoria` (
  `idprodotto` int(11) NOT NULL,
  `idcategoria` int(11) NOT NULL,
  PRIMARY KEY (`idprodotto`,`idcategoria`),
  CONSTRAINT FOREIGN KEY (`idprodotto`) REFERENCES `prodotto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

 CREATE TABLE `login` (
  `id` char(36) NOT NULL,
  `idutente` int(11) NOT NULL,
  `token` char(36) NOT NULL,
  `time` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY (`idutente`),
  CONSTRAINT FOREIGN KEY (`idutente`) REFERENCES `utente` (`id`)
);

LOCK TABLES `utente` WRITE;
INSERT INTO `utente` VALUES (1,'utente1',SHA1('password1'),'Utente 1','utente1@test.com',1),(2,'utente2',SHA1('password2'),'Utente 2','utente2@test.com',0),(3,'utente3',SHA1('password3'),'Utente 3','utente3@test.com',0);
UNLOCK TABLES;


LOCK TABLES `categoria` WRITE;
INSERT INTO `categoria` VALUES (1,'Integratori','Per integrazione si intende l integrazione alimentare comunemente adottata da coloro che praticano culturismo o altri sport. Tali integratori possono sostituire i pasti, migliorare l aumento di peso, promuovere la perdita di peso o migliorare le prestazioni atletiche. Tra i più usati si possono citare gli integratori vitaminici, proteine, amminoacidi ramificati (BCAA), glutammina, acidi grassi essenziali, prodotti sostitutivi dei pasti, creatina, prodotti per la perdita del peso o per l aumento del testosterone.'),
(2,'Abbigliamento','L abbigliamento da palestra include oggetti indossabili come scarpe adeguate, guanti o anche altri indumenti volti a migliorare la performance.'),
(3,'Alimenti proteici','Alimenti ricchi di proteine e salutari, allo scopo di incrementare la massa muscolare, mantenendo una percentuale di grassi bassa.'),
(4,'Bevande proteiche','Bevande ricche di proteine a basse contenuto di grassi indicate per quando hai bisogno di energie immediate, o quando si è fuori casa.');
UNLOCK TABLES;

LOCK TABLES `prodotto` WRITE;
INSERT INTO `prodotto` VALUES (1,'Armolipid plus','La Berberis aristata e.s. contenuta in Armolipid Plus favorisce il controllo del colesterolo e dei trigliceridi plasmatici ad integrazione di una dieta globalmente adeguata a tal fine.
Il riso rosso fermentato contiene la monacolina k, che interviene nel metabolismo del colesterolo e la sua attività è di entità correlata alla dose somministrata
Il Policosanolo è una miscela di alcoli grassi naturali contenuti nella matrice cerosa della canna da zucchero, della crusca di riso e nella cera d''api
Il coenzima Q10 è un costituente fisiologico del nostro organismo che interviene nelle reazioni ossido-riduttive coinvolte nella sintesi dell''atp (adenosina trifosfato)
Gli integratori non vanno intesi quali sostituti di una dieta variata, equilibrata e di un sano stile di vita',3000, '1.jpg'),
(2,'Vitamaze','ALTO DOSAGGIO 180 compresse, piccolo e vegane per un’assunzione continua di 6 mesi con 8 vitamine essenziali del gruppo B: vitamina B1 (tiamina), B2 (riboflavina), B3 (niacina), B5 (acido pantotenico), B6 (piridossina), B7 (biotina), B9 (acido folico), B12 (metilcolbalamina).
VEGANO: Le nostre compresse di vitamine del complesso B sono prodotte esclusivamente con ingredienti non animali e sono quindi ideali per i VEGANI e i VEGETARIANI. Il nostro prodotto non contiene OGM o inutili additivi.
LA MIGLIORE BIODISPONIBILITÀ: Prive di stearato di magnesio (sali di magnesio degli acidi grassi), un discusso additivo, per l’ASSUNZIONE OTTIMALE DI INGREDIENTI ATTIVI. Molti produttori utilizzano lo stearato di magnesio come separatore degli agenti durante la produzione.
PRODOTTO DI QUALITÀ TEDESCO: nostri prodotti vengono prodotti solo in Germania. La nostra produzione si basa sul modello HACCP. Lavoriamo a stretto contatto con scienziati ed esperti durante il processo di produzione dei nostri prodotti.
SODDISFAZIONE GARANTITA: Soddisfare i clienti è molto importante per noi, quindi sentiti libero di contattarci se hai delle domande riguardo ai nostri prodotti. Siamo qui per te. Acquista oggi SENZA RISCHIO, al miglior rapporto qualità-prezzo sul mercato, ti offriamo 30 giorni di reso gratuito',1600, '2.jpg'),
(3,'Elika','Estratto puro di Curcuma + Piperine Quality: 240 compresse da 500 mg vegan, naturale. Contiene estratto di piperina per migliorare i benefici della curcuma, che porta ad un maggiore assorbimento nel corpo quando i due ingredienti sono consumati insieme. Facile assorbimento.
Vantaggi: La curcuma è un potente antinfiammatorio che allevia i dolori articolari, contiene antiossidanti, vitamine e minerali che aiutano a migliorare la nostra digestione.
- Raccomandazioni: Prendere da 4 a 8 compresse al giorno con un bicchiere d''acqua.
Elikafoods: Il nostro prodotto è adatto a vegetariani e vegani, è stato certificato, senza glutine, 100% naturale. Prodotto di altissima qualità. Il nostro obiettivo principale è quello di ottenere effetti positivi sul benessere degli individui e della società, e contribuire al miglioramento della nostra salute è certamente uno dei modi più importanti per raggiungere questo obiettivo.
-Cura personale: Abbiamo la possibilità di prenderci cura di voi in caso di dubbio o richiesta.',2000, '3.jpg'),
(4,'Iris & Lilly Reggiseno sportivo','Fascia sul sottoseno
Imbottitura nelle coppe rimovibile per adattarlo al proprio corpo
82% Poliestere, 18% Elastan
lavaggio in lavatrice (30°C)
Inserto in mesh per una maggiore traspirabilità
Spalline larghe incrociate sul retro',1500, '4.jpg'),
(5,'XDSP Pantaloncini Sportivi','Traspiranti e morbidi - Il tessuto leggero di cui si compongono i pantaloncini corsa uomo assicura un comfort ottimale ed è anche molto traspirante, Pantaloni esterni leggeri e traspiranti con elastico in vita Pantaloni esterni leggeri e traspiranti, Materiale ad asciugatura rapida, morbido, elastico e ultra traspirante.
Design a doppio strato- I pantaloncini da allenamento per uomo sono pantaloncini integrati con tasca nascosta con vestibilità che supportano i muscoli della coscia e migliorano le prestazioni, serve per riporre il telefono cellulare, il contapassi, ecc.
Poliestere
Chiusura: Coulisse
Asciugatura rapida- il sudore viene allontanato dalla pelle dal tessuto dei leggings termici, si asciugano rapidamente e rimangono freschi grazie agli inserti in rete intelligenti, assorbimento di umidità, traspirabilità e facilità di movimento, per una maggiore traspirabilità che ti mantiene fresco quando fa caldo.
CINTURINO REGOLABILE- Pantaloncini da palestra da uomo con coulisse interna regolabile, regola il tuo comfort in base alle tue preferenze con cordino per una vestibilità comoda, Queste caratteristiche rendono i pantaloni il compagno perfetto di tutti i giorni.
Regalo d''amore: è un''ottima idea come un piccolo regalo di compleanno per uomo, regalo per la persona che ami. Nota di formato: Le dimensioni fornite sono in standard cinese, si prega di controllare le dimensioni nella descrizione seguente e decidere l''acquisto, Si prega di ordinare 1-2 dimensioni più grandi del solito come dimensioni asiatiche più piccole delle dimensioni UE.',800, '5.jpg'),
(6,'FINGER TEN','UTILITÀ:Guanti da ciclismo Uomo Donna Sono realizzati in materiale di alta qualità che consente visibilità e sicurezza durante la guida notturna. Può essere utilizzato in molti sport all''aria aperta come ciclismo, palestra, alpinismo, escursionismo, ecc. Questo guanto da mezzo dito è adatto per la primavera estate e l''autunno.
CHE ASSORBE GLI URTI:I nostri guanti da bici da strada sono i guanti da ciclismo preferiti perché sono dotati di un''imbottitura in silicone resistente per impedire lo scivolamento. A differenza di alcuni golfisti per uomo e donna sul mercato, il rivestimento spesso con palmo di 5 mm di questi guanti può regalare un''esperienza ammortizzante.
TRASPIRANTE E CONFORTEVOLE:I guanti sono realizzati in lycra altamente elastica e tessuto a maglia lavorato a maglia, facili da indossare e da togliere. Il tessuto a rete sul palmo consente al sudore di evaporare dai guanti da ciclismo. Lycra morbida e liscia sulla superficie dei guanti da bicicletta, migliora la flessibilità della mano e mantieni la mano più comoda.
BEN CONFEZIONATO IN BUONE CONDIZIONI:Riceverai il prodotto ben confezionato in buone condizioni. Ogni guanto verrà prima messo in una piccola busta e poi nel pacchetto di carta.
NESSUN RISCHIO E ACQUISTA CON FIDUCIA: TUTTI i prodotti Finger Ten sono idonei per la politica di restituzione e modifica di 30 giorni di Amazon. Finger Ten è un nuovo marchio costruito in Germania e mirato a soddisfare al 100% tutti i nostri clienti.',1000, '6.jpg'),
(7,'NV Fasce di Compressione per Polpacci','Vendute in COPPIA. Le fasce di compressione per polpacci unisex ad alta performance (con una compressione 20-30mmHg) utilizzano filati tecnici per offrire comfort e recupero durante e dopo l''esercizio fisico.
Benefici durante e dopo l''esercizio fisico - Supporto di compressione DURANTE l''esercizio fisico - Recupero di compressione DOPO l''esercizio fisico
Ideali per tutte le attività sportive, ad es. ciclismo, corsa, triathlon, rugby, calcetto, fitness, palestra, golf, tennis, ecc. Anche per l''uso durante i viaggi aerei per combattere la trombosi venosa oppure se dovete stare in piedi a lungo durante il lavoro.Vendute in COPPIA. Le fasce di compressione per polpacci unisex ad alta performance (con una compressione 20-30mmHg) utilizzano filati tecnici per offrire comfort e recupero durante e dopo l''esercizio fisico.
Benefici durante e dopo l''esercizio fisico - Supporto di compressione DURANTE l''esercizio fisico - Recupero di compressione DOPO l''esercizio fisico
Ideali per tutte le attività sportive, ad es. ciclismo, corsa, triathlon, rugby, calcetto, fitness, palestra, golf, tennis, ecc. Anche per l''uso durante i viaggi aerei per combattere la trombosi venosa oppure se dovete stare in piedi a lungo durante il lavoro.',1500, '7.jpg'),
(8,'THE PROTEIN WORKS','Burro di peanuts fatto con peanuts tostate naturali al 100%.
Una fonte di proteine di qualità
Non contiene assolutamente zucchero o sale aggiuntivi
Alto contenuto di grassi insaturi sani
Un''eccellente fonte di vitamine',1000, '8.jpg'),
(9,'PANE BAULETTO ai CEREALI PROTEICO LINE','OTTIMO complemento per la tua DIETA IPERPROTEICA!
Confezione da 365 grammi
16 fette da 22.5 grammi
1 porzione = 2 fette (45 g 137.85 kcal)
Ad alto contenuto di proteine e fibre, possono accompagnare il tuo pasto sostituendo il pane, con verdure ed affettati magri, essere a dieta sarà solo un ricordo lontano!',1500, '9.jpg'),
(10,'Bresup ','40% proteine; la leggerezza e l''apporto energetico fanno di bresup un alimento eccezionale per chi pratica sport
2.3% di grassi; indicato nelle diete perché povero di grassi ma ricco di valori nutrizionali e amminoacidi essenziali
64 calorie e solo 3 ingredienti per ogni barretta
Senza zuccheri, ideale per la tua dieta!
Senza glutine e senza lattosio
Si conserva fuori dal frigorifero',3200, '10.jpg'),
(11,'BISCOTTI IPERPROTEICI Line@Diet','Line@Diet vi propone una vasta gamma di biscotti in vari gusti pronti al consumo.
I BISCOTTI Line@DIET IPERPROTEICI sono una soluzione dietetica grazie al numero ridotto di calorie, all’apporto completo di proteine e la quasi assenza di zuccheri e carboidrati
A basso contenuto di calorie e ricchi di proteine, questi biscotti iperproteici golosi e gustosi sono convenienti per calmare un improvviso appetito e si adattano perfettamente alle diverse assunzioni di proteine previste nel quadro della DIETA PROTEICA: COLAZIONE, DESSERT del pasto, MERENDA o cena.
LA TUA DIETA da OGGI ha un DOLCE in PIU'' per non farti mancare proprio nulla!
A SCELTA TRA 6 GUSTI DIVERSI: RICOPERTO AL CIOCCOLATO - COOKIES BISCOTTO - CACAO E NOCCIOLE - ARANCIA - FRUTTI ROSSI MELA CANNELLA',2400, '11.jpg'),
(12,'Ensure Plus ','ALIMENTO NUTRIZIONALE COMPLETO - Alimento ad altà densità calorica che può essere utilizzato come unica fonte nutrizionale o come supplemento nutrizionale, sotto controllo medico.
PROTEINE - Contiene 12,5g di proteine per bottiglietta.
VITAMINE - Contiene vitamine D3, A, E, K1, C, Acido Folico, Vitamina B12, B6, B2, B1, Niacina, Acido Pantotenico, Biotina.
- Agitare bene e, una volta aperto, conservare coperto in frigorifero e utilizzare entro 24 ore.',1300, '12.jpg'),
(13,'PBN siero di latte in polvere','PBN, siero di latte in polvere, gusto cioccolato, vasetto da 2,27 kg
Ogni porzione contiene 23 g di proteine.
Ingredienti di qualità premium
Prodotto adatto ai vegetariani.
Ogni vasetto contiene 75 porzioni.',4000, '13.jpg'),
(14,'Fly Nutrition','Elle è un frullato a base di proteine e carboidrati, ideale per chi vuole mettersi in forma con un prodotto sano e bilanciato.
Elle ha un gustoso sapore di cioccolato e una piacevole cremosità che delizieranno tutti i tuoi sensi.
Elle ti farà sentire sazia e leggera, pronta per affrontare la giornata piena di energia! Puoi dire Addio agli attacchi di fame.
Elle ti dona un apporto nutrizionale bilanciato. Ha un basso contenuto calorico ed è arricchito con vitamine e minerali. La ricetta italiana al 100% è sinonimo di sicurezza e qualità controllata.
Elle è facile da preparare. Mescola da 1 a 2 (in base alla tua fame) misurini (troverai il misurino nella confezione) di polvere in 150/300 ml di acqua o latte (temperatura a piacere). In pochi secondi otterrai un frullato cremoso e senza grumi. Otterrai fino a 21 porzioni.',2600, '14.jpg'),
(15,'Pesoforma Nature Smoothie','PERDITA E CONTROLLO DEL PESO: 1 Smoothie veg é un pasto completo con solo 206 kcal, efficace per la perdita del peso, scientificamente testato
CON MELA E CRUSCA D''AVENA: Si prepara con uno shaker, è un pasto sano e bilanciato, a base di crusca d’avena e mela, ottimo a pranzo e a colazione
1 SMOOTHIE = 1 PASTO COMPLETO ED EQUILIBRATO: con 24 vitamine e minerali, apporta il corretto equilibrio fra proteine, carboidrati e grassi (reg. UE)
FACILE DA PREPARARE: versa in uno shaker o frullatore 4 misurini di prodotto in 200 ml di latte freddo e agita. Misurino all''interno del barattolo
COME PIU'' TI PIACE: per dare più gusto aggiungi un cucchiaino di cacao amaro o un paio di mandorle. L''efficacia della tua dieta non sarà alterata
PENSATO PER LE TUE ESIGENZE: per ritrovare la forma in un piano dieta ipocalorico o quando hai poco tempo e non vuoi rinunciare ad un pasto completo',900, '15.jpg');
UNLOCK TABLES;
LOCK TABLES `prodotto_categoria` WRITE;
INSERT INTO `prodotto_categoria` VALUES (1,1),(2,1),(3,1),(4,2),(5,2),(6,2),(7,2),(8,3),(9,3),(10,3),(11,3),(12,4),(13,4),(14,4),(15,4);

UNLOCK TABLES;
