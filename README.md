NOTA INIZIALE:
Github non consente di salvare file pi� grandi di 100 MB, quindi non abbiamo potuto caricare le jdk.
Esse dovrebbero trovarsi nella cartella shared/resources , e in particolare abbiamo usato il file "jdk-8u91-linux-x64.tar.gz" scaricabile da http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html
L'alternativa di scaricarle all'avvio della macchina virtuale ci � sembrata troppo lenta e dipendente della qualit� della connessione per fare la prova di esecuzione.


Il progetto permette l'esecuzione di un'applicazione web su un ambiente distribuito tramite l'utilizzo di vagrant.
L'ambiente prevede due macchine virtuali:
- in una prima macchina � presente un database utilizzato dall'applicazione
- nella seconda macchina � installato un server per collegare le due macchine virtuali e la macchina fisica che accede all'applicazione web.

L'applicazione web � stata realizzata tramite le seguenti tecnologie:
- JSP per lo sviluppo della logica di presentazione e l'utilizzo delle servlet per la gestione delle richieste del server
- il framework JPA per la gestione della persistenza, nel caso specifico gestisce entit� come Prodotti, Fornitori, Ordini all'interno dell'applicazione
- il DBMS Postgres presente nella prima macchina virtuale
- l'application server TomEE che implementa le specifiche JSP e Servlet installato nella seconda macchina virtuale
- Vagrant per la creazione dell'ambiente
- il software Puppet per il provisioning

Il comando "vagrant up" prepara tutto l'ambiente in modo automatico, ossia:
- crea le due macchine virtuali
- installa Postgres nella prima macchina virtuale
- carica un database iniziale
- installa Java8 e TomEE nella seconda macchina virtuale
- avvia Tomcat

Si accede all'applicazione web tramite l'indirizzo localhost:5678/paws-and-claws/index.xhtml


Partecipanti:
- Alessio Daniele Marra
- Daniele Petrillo
- Anton Shanya
