# Petri Nets

## Tools

- [http://www.pntool.ac.tuiasi.ro/download.php](http://www.pntool.ac.tuiasi.ro/download.php)
- [http://www.pntool.ac.tuiasi.ro/petrinet2.4_full_p2015.zip](http://www.pntool.ac.tuiasi.ro/petrinet2.4_full_p2015.zip)

[APO](https://apo.adrian-jagusch.de/#!/Sample%20Net)

## Flow of tokens

![](Petri%20Nets/Screen_Shot_2020-11-03_at_01.41.41.png)

## Input and Output matrixes

Lets take a look on this petri net

![](Petri%20Nets/Screen_Shot_2020-11-06_at_00.46.18.png)

For this net we get this output matrix (remember output is in relation to transitions i.e. output for transition)

$$\begin{bmatrix}
1 & 0 & 0 & 0 & 0 \\
0 & 0 & 1 & 1 & 0 \\
0 & 1 & 0 & 0 & 0 \\
0 & 0 & 0 & 0 & 1 \\
\end{bmatrix}$$

Сolumns corresponds for **places (p1 ... p5)**. Rows - for **transitions (t1 ... t4)**

**Same relation for input**

or

![](Petri%20Nets/Screen_Shot_2020-11-06_at_01.21.17.png)

## Reachability graph

The reachability graph of a PN contains all the necessary information to decide:

- boundedness
- place boundedness
- semi-liveness

## Properties

- **Boundedness**
    
    is the number of reachable markings bounded ?
    
    ![](Petri%20Nets/Screen_Shot_2020-11-06_at_01.01.46.png)
    
- **Place Invarience**
    
    Is number of tokens for set of places consant?
    
    ![](Petri%20Nets/Screen_Shot_2020-11-06_at_01.18.05.png)