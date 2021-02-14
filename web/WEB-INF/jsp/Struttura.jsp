<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%><%@taglib prefix="c"
                                         uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="header.jsp">
    <jsp:param name="pageTitle" value="Struttura"/>
</jsp:include>
<section>
    <center><h1>Nemea</h1></center>
            <div col="1/2">
                <img src="img/palestr.jpg">
            </div>
      <div col="1">
         <p id="palestra"></p>
          </div>
</section>
<section>
    <div col="1/2">
        <img src="img/piscina.jpg">
    </div>
    <div col="1">
        <p id="piscina"></p>
    </div>
</section>
<section>
    <img src="img/palestraopen.jpg">
    <div col="1/2">
    </div>
    <div col="1">
        <p id="palestraopen"></p>
    </div>
</section>
<section>
    <div col="1/2">
        <img src="img/salecorsi.jpg">
    </div>
    <div col="1">
        <p id="salecorsi"></p>
    </div>
    </section>
<%@include file="footer.html"%>


<script>
    document.getElementById("palestra").innerHTML = "La Sala Pesi di 1200 mq. è un'area interamente dedicata al movimento per la tonificazione e per l'allenamento cardiovascolare.La sala pesi offre una vasta gamma di attrezzi per soddisfare tutte le esigenze ed i desideri delle persone.Chi desidera sviluppare e potenziare la muscolatura troverà entusiasmanti le attrezzature della linea \"Pure\" di Technogym; chi ama mantenersi in forma senza lunghi ed intensi allenamenti può utilizzare oltre 60 attrezzi per la tonificazione di ultima generazione. Le oltre 45 macchine per il cardiofitness disponibili in sala pesi rendono immediato l'incremento della resistenza agli sforzi prolungati, allenando il cuore e riducendo gli eventuali grassi in eccesso.";
    document.getElementById("palestraopen").innerHTML = "L'attività sportiva, intesa come mezzo di formazione e sviluppo psico-fisico della personalità umana, e non come pura espressione di agonismo o di spettacolo sportivo, va naturalmente favorita e stimolata.Il tema del verde inteso come contatto con la natura e quello dell'attività sportiva in città sono indissolubilmente legati tra loro.Oltre alla bicicletta e ai relativi percorsi ciclabili, nel verde si può effettuare footing e possono essere realizzate molte altre attività sportive, sia in impianti chiusi dislocati internamente o a bordo di aree verdi, sia all'aperto, in impianti e attrezzature in libero uso.Dal 2009, si stanno realizzando anche, a titolo sperimentale, delle nuove aree dedicate principalmente agli adulti e agli anziani, chiamate aree fitness, che ospitano esclusivamente attrezzature per la ginnastica dolce adatte all'età adulta e senior";
    document.getElementById("piscina").innerHTML = "La piscina olimpionica è il modello regolamentare di vasca che viene utilizzato nei giochi olimpici e in tutte le maggiori manifestazioni natatorie a livello internazionale. Come stabilito dalla FINA, deve essere lunga 50 m e larga 25 m, composta da 10 corsie di larghezza 2,50 m, delle quali ciascuna deve avere una profondità minima di 2 m e, raccomandata di 3 m, se la piscina è di tipo polivalente e viene utilizzata per ospitare altre discipline come il nuoto sincronizzato. Per lo svolgimento dei campionati Mondiali, la piscina dovrà essere lunga 25 m e larga 25 m, costituita da 10 corsie di larghezza 2,5 m ciascuna, la profondità minima consentita è di 1,35 m. Le vasche olimpioniche, semiolimpioniche o addestramento nuoto Cemi, oltre a rispettare le normative FINA, FIN e CONI in merito alle caratteristiche strutturali, sono realizzate nel pieno rispetto delle normative vigenti in ciascun Paese, riguardante i requisiti degli impianti di circolazione, trattamento, disinfezione e qualità dell'acqua di piscina.";
    document.getElementById("salecorsi").innerHTML = "In ampie sale, climatizzata e riservate vengono oganizzati numerosi corsi.Attività aerobica svolta a ritmo di musica, con utilizzo di trampolini elastici, divertimento e fatica per ottenere tonificazione e dimagrimento.Tabata Forma di allenamento intensivo a corpo libero volto a migliorare la resistenza ed utile al dimagrimento.";
</script>
