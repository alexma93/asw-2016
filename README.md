Il progetto permette l'esecuzione di un'applicazione web su un ambiente distribuito tramite l'utilizzo di vagrant.
L'ambiente prevede due macchine virtuali:
- in una prima macchina è presente un database utilizzato dall'applicazione
- nella seconda macchina è installato un server per collegare le due macchine virtuali e la macchina fisica che accede all'applicazione web.

L'applicazione web è stata realizzata tramite le seguenti tecnologie:
- JSP per lo sviluppo della logica di presentazione e l'utilizzo delle servlet per la gestione delle richieste del server
- il framework JPA per la gestione della persistenza, nel caso specifico gestisce entità come Prodotti, Fornitori, Ordini all'interno dell'applicazione
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
