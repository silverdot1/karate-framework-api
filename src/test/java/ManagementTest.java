
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class ManagementTest {

    // Method to execute test cases in parallel
    // path: it is going to execute the 'companies' package
    // tags: it is going to ignore the features with the tag @ignore
    // parallel: number of threads to execute
    @Test
    void testParallelCucumberReport(){
        Results results =  Runner.path("classpath:companies").outputCucumberJson(true).tags("~@ignore").parallel(4);
        generateReport(results.getReportDir());
    }
    public static void generateReport(String karateOutputPath){
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[]{"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("build"), "Karate-Framework-Demo");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }

}
