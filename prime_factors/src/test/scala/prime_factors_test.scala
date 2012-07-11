import org.scalatest.FlatSpec
import org.scalatest.matchers.ShouldMatchers

class PrimeFactorsTest extends FlatSpec with ShouldMatchers {
  val pf = new PrimeFactors
  pf.generate() should equal(1)
}
