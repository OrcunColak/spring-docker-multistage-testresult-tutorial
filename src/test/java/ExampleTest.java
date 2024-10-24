import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.fail;

public class ExampleTest {

    @Test
    void failingTest() {
        fail("failTest failed");
    }

    @Test
    void anotherFailingTest() {
        fail("anotherFailingTest failed");
    }

    @Test
    void successTest() {
        int result = 2;
        assertEquals(2, result);
    }
}
