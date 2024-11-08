#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#
cp -r /tmp/gravitino/*.ipynb /home/jovyan
export HADOOP_USER_NAME=root

# This needs to be downloaded as root user
wget https://repo1.maven.org/maven2/org/apache/iceberg/iceberg-spark-runtime-3.4_2.12/1.5.2/iceberg-spark-runtime-3.4_2.12-1.5.2.jar  -O $SPARK_HOME/jars/iceberg-spark-runtime-3.4_2.12-1.5.2.jar
wget https://repo1.maven.org/maven2/org/apache/gravitino/gravitino-spark-connector-runtime-3.4_2.12/0.6.0-incubating/gravitino-spark-connector-runtime-3.4_2.12-0.6.0-incubating.jar -O $SPARK_HOME/jars/gravitino-spark-connector-runtime-3.4_2.12-0.6.0-incubating.jar

# in pyspark-notebook, SPARK_HOME is at /usr/local/spark, we need to link it back to /opt/spark 
ln -s $SPARK_HOME /opt/spark

su - jovyan

start-notebook.sh --NotebookApp.token=''
