## view in couchbase
1. map function 的结果是按照emit（key, value)中的key来排序的
2. design documents are replicated automatically to all the nodes within the cluster and are always kept in synchronization.
3. During a view query, the index information for the given view query on all the nodes within the cluster is collated returned to the client.
4. View index queries are always accessed from disk; Indexes are note kept in RAM by Couchbase Server.
5. Indexes are created by Couchbase Server based on the view definition, but updating of these indexes can be controlled at the point of data querying, rather then each time data is inserted. 
6. Whether the index is updated when queries can be controlled through the `stale` parameter.
7. Irrespective of the `stale` parameter, documents can only be indexed by the system once the document has been persisted to disk. If the document has not been persisted to disk, use of the `stale` will not force this process.
8. Irrespective of the automated update process, documents can only be indexed by the system once the document has been persisted to disk. If the document has not been persisted to disk, the automated update process will not force the unwritten data to be written to disk.
9. The view results are eventually consistent with what is stored in memory base on whether documents have been persisted to disk. It is possible to write a document to the cluster, and access the index, without the newly written document appearing in the generated view index.
10. Conversely, documents that have been stored with an expiry may continue to be included within the view index until the document has been removed from the database by the expiry pager.
