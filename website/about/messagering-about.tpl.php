<p><strong>diff</strong> program output N = 1000 with this <a href="iofile.php?test=<?=$SelectedTest;?>&amp;lang=<?=$SelectedLang;?>&amp;file=output">output file</a> to check your program is correct before contributing.
</p>

<p>Each program should create and keep alive, 503 threads linked in an unbroken ring, and pass a value between one thread and the next thread at least N times. Programs may use kernel threads, lightweight threads, cooperative threads&#8230;</p>

<p>Each program should</p>
<ul>
   <li>create 503 linked threads (named 1 to 503)</li>
   <li>thread 503 should be linked to thread 1, forming an unbroken ring</li>           
   <li>pass the value to thread 1</li>     
   <li>pass the value from thread to thread N times</li>        
   <li>print the name of the last thread (1 to 503) to take the value</li>
</ul>

<p>Similar benchmarks are described in <a href="http://www.sics.se/~joe/ericsson/du98024.html">Performance Measurements of Threads in Java and Processes in Erlang, 1998;</a> and <a href="http://www.cl.cam.ac.uk/users/mr/Cobench.html">A Benchmark Test for BCPL Style Coroutines, 2004.</a> 
For some language implementations increasing the number of threads quickly results in <a href="http://www.mozart-oz.org/documentation/apptut/node9.html#chapter.concurrency.cheap">Death by Concurrency</a>.</p>
