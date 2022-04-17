# TCP

Uses a **byte stream service** (we can send any amount of bites and they are spilted in ip packets)

- Connection oriented (before sending something establish connection)
- Reliable

## **Connection establishment**

If the SYN flag is set (1), then this is the initial sequence number. The sequence number of the actual first data byte and the acknowledged number in the corresponding ACK are then this sequence number plus 1

To establish a connection, TCP uses a three-way [handshake](https://en.wikipedia.org/wiki/Handshaking). Before a client attempts to connect with a server, the server must first bind to and listen at a port to open it up for connections: this is called a passive open. Once the passive open is established, a client may initiate an active open. To establish a connection, the three-way (or 3-step) handshake occurs:

1. **SYN**: The active open is performed by the client sending a SYN to the server. The client sets the segment's sequence number to a random value A.
2. **SYN-ACK**: In response, the server replies with a SYN-ACK. The acknowledgment number is set to one more than the received sequence number i.e. A+1, and the sequence number that the server chooses for the packet is another random number, B.
3. **ACK**: Finally, the client sends an ACK back to the server. The sequence number is set to the received acknowledgement value i.e. A+1, and the acknowledgement number is set to one more than the received sequence number i.e. B+1.

## **Summary**

1. Client: SYN=1, Seq=A -> Server
2. Server: SYN=1, ACK=1, Seq=B, Ack=A+1 -> Client
3. Client: ACK=1, Ack=B+1, Seq=A+1 -> Server
4. DONE, Connection established