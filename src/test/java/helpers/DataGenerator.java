package helpers;

import com.github.javafaker.Faker;

import java.util.Random;
import java.util.UUID;

public class DataGenerator {
    private static final Faker faker = new Faker();
    public static String characters(int minimumLength, int maximumLength, boolean includeUppercase, boolean includeDigit) {
        return faker
                .lorem()
                .characters(
                        minimumLength,
                        maximumLength,
                        includeUppercase,
                        includeDigit
                );
    }

    public static String name() {
        return faker
                .name()
                .firstName();
    }

    public static String email() {
        return faker
                .internet()
                .emailAddress();
    }

    public static int randomInt() {
        Random random = new Random();
        int value = random.nextInt();
        return value;
    }

    public static int randomInt(int[] value) {
        Random random = new Random();
        int pickValue = random.nextInt(value.length);
        return value[pickValue];
    }

    public static String parseUUIDToString(UUID value){
        return value.toString();
    }


}
