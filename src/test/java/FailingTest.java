import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.fail;

public class FailingTest {

    @Test
    void failTest() {
        fail("failTest failed");
    }

    @Test
    void successTest() {
        int result = 2;
        assertEquals(2, result);
    }
}
