void main(MultiBuild::Workspace& workspace) {	
	auto project = workspace.create_project(".");
	auto properties = project.properties();

	project.name("poly2tri");
	properties.binary_object_kind(MultiBuild::BinaryObjectKind::eStaticLib);
	project.license("./LICENSE");

	project.include_own_required_includes(true);
	project.add_required_project_include({
		"./poly2tri"
	});

	properties.files({
		"./poly2tri/**.h",
		"./poly2tri/**.cc"
	});

	{
		MultiBuild::ScopedFilter _(project, "project.compiler:VisualCpp");
		properties.disable_warnings({ "4267", "4715" });
	}
}