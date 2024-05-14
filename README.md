# Reproducing HADOOP-16435

## Explanation

(2019) Hadoop provides a high level Server class for other Apache libraries like Hive and Tez to use. These Server instances are used as sessions for remote connections, and are created and deleted multiple times within single processes. Each Server instantiates RpcMetrics and RpcDetailedMetrics and registers them to the static DefaultMetricsSystem. However, on Server shutdown, RpcMetrics are not deregistered from the system.

- **Workload:** Create many servers and monitor increases in heap usage.

- **Impact/symptom:** Memory leak

- **Fix:** in `Rpc(Detailed)Metrics` `shutdown()` method, deregister from DefaultMetricsSystem.

## Further materials

[Link to YouTube explanation.](https://youtu.be/Os8tEE-gDlY)

[Link to Trovi package.](https://www.chameleoncloud.org/experiment/share/87417dd3-c55a-4081-8a3e-07c421846c68)

[Link to Trovi demo.](https://youtu.be/zyn6EioK3vY)

[Link to original Jira report.](https://issues.apache.org/jira/browse/HADOOP-16435)
