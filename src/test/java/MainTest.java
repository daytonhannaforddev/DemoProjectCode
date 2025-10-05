package demo;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class MainTest {
    @Test
    void helperReturnsOK() {
        assertEquals("OK", Main.helper());
    }
}
