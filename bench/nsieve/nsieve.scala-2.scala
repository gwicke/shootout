/* The Computer Language Shootout
   http://shootout.alioth.debian.org/
   contributed by Isaac Gouy
*/


object nsieve { 

   def nsieve(m: int, isPrime: Array[boolean]) = {
      var i = 2
      while (i < m){ isPrime(i) = true; i = i+1 }
      var count = 0

      i = 2
      while (i < m){
         if (isPrime(i)){
            var k = i+i
            while (k < m){ isPrime(k) = false; k = k+i }
            count = count + 1
         }

         i = i+1
      }
      count
   }


   def main(args: Array[String]) = {
      val n = Integer.parseInt(args(0))
      val m = (1<<n)*10000
      val flags = new Array[boolean](m+1)

      def printPrimes(m: int) = {
         def pad(i: int, width: int) = {
            var s = i.toString
            var p = width - s.length
            while (p > 0){ s = ' ' + s; p = p-1 }
            s
         }

         Console.println("Primes up to " +  pad(m,8) + pad(nsieve(m,flags),9))
      }


      printPrimes(m)
      printPrimes( (1<<n-1)*10000 )
      printPrimes( (1<<n-2)*10000 )
   } 
}
