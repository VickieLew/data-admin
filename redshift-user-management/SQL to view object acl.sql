
SELECT pg_get_userbyid(b.nspowner)::text AS objowner,
		null::text AS schemaname,
		b.nspname::text AS objname,
		'schema'::text AS objtype,
		TRIM(SPLIT_PART(array_to_string(b.nspacl,','), ',', NS.n))::text AS aclstring,
		NS.n as grantseq
		FROM 
		(SELECT oid,generate_series(1,array_upper(nspacl,1)) AS n FROM pg_namespace) NS
		inner join pg_namespace B ON b.oid = ns.oid AND NS.n <= array_upper(b.nspacl,1)
		where nspowner>1 
