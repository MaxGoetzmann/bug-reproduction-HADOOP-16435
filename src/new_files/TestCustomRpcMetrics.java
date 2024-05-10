package org.apache.hadoop.ipc.metrics;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Writable;
import org.apache.hadoop.ipc.RPC;
import org.apache.hadoop.ipc.Server;
import org.apache.hadoop.metrics2.MetricsSystem;
import org.apache.hadoop.metrics2.lib.DefaultMetricsSystem;
import org.junit.Test;
import java.io.File;
import java.io.FileOutputStream;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.List;

public class TestCustomRpcMetrics {

  @Test
  public void customMetricsAreUnregistered() throws Exception {
    File file = new File("../../../heap_usage.txt");
    FileOutputStream fos = new FileOutputStream(file);
    PrintStream ps = new PrintStream(fos);

    File csv = new File("../../../heap_usage.csv");
    FileOutputStream fos_csv = new FileOutputStream(csv);
    PrintStream ps_csv = new PrintStream(fos_csv);

    Configuration conf = new Configuration();

    long totalMemory = Runtime.getRuntime().totalMemory();
    long usedMemory = -1, prev = -1;
    for (int i = 0; i < 25000; i++) { // Port binding error when 2^16 iterations exceeded
      prev = usedMemory;
      long freeMemory = Runtime.getRuntime().freeMemory();
      usedMemory = totalMemory - freeMemory;

      if (usedMemory < prev) {
        ps.println("Iteration " + i + ": Used memory = " + usedMemory + " out of " + totalMemory);
        ps_csv.println((i - 1) + ", " + prev);
        ps_csv.println(i + ", " + prev);
      }

      Server server = new Server("0.0.0.0", 0, LongWritable.class, 1, conf) {
        @Override
        public Writable call(
            RPC.RpcKind rpcKind, String protocol, Writable param,
            long receiveTime) throws Exception {
          return null;
        }
      };

      server.stop();
    }
  }

}
