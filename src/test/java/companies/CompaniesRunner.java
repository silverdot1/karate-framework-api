package companies;

import com.intuit.karate.junit5.Karate;

public class CompaniesRunner {
    @Karate.Test
    Karate testCompanies(){
        // It is going to execute all the features in get package
        //return Karate.run().relativeTo(getClass());
        // If you want to run a specified feature
        return Karate.run("classpath:companies").relativeTo(getClass());
    }
    @Karate.Test
    Karate testTags() {
        return Karate.run().tags("@End2End").relativeTo(getClass());
    }

    @Karate.Test
    Karate testSystemProperty() {
        return Karate.run("classpath:companies/crud/companies-crud.feature")
                .tags("@End2End")
                .karateEnv("dev")
                .systemProperty("foo", "bar");
    }
}
