# graphCoverStrategyEvaluationData
Data of the graph cover strategy evaluation

The folders BTC2014, WatDiv100M and WatDiv1000M contains the material for the experiments performed with the corresponding data sets. Each folder contains a createDatasets.sh or createDataset.sh script that creates the data sets used in the evaulation automatically.

The queries used for the evaluation are stored in the subfolder queries.

The <code>measurements_raw</code> folder or tar.xz contains the raw measurements that were recorded during the execution of the experiments. The corresponding <code>measurements_preprocessed</code> folder or tar.xz contains the raw measurements preprocessed with CEP. They can be used to create diagrams. Precreated diagrams are stored in the <code>diagram</code> folder or tar.xz.