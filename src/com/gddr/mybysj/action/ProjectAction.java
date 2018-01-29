package com.gddr.mybysj.action;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.gddr.mybysj.entities.Category;
import com.gddr.mybysj.entities.Project;
import com.gddr.mybysj.entities.User;
import com.gddr.mybysj.service.CategoryService;
import com.gddr.mybysj.service.ProjectService;
import com.opensymphony.xwork2.ModelDriven;

@Controller
public class ProjectAction extends BaseAction implements ModelDriven<Project> {
	@Autowired
	private ProjectService projectService;
	@Autowired
	private CategoryService categoryService;
	private Project model;

	public void preparePublish() {
		System.out.println("---------preparePublish-----------");
		model = new Project();
	}

	public String publish() {
		System.out.println("---------publish---------");
		User currUser = (User) session.getAttribute("currUser");
		System.out.println(currUser);

		model.setPublisher(currUser);
		model.setCreateTime(new Date());
		model.setDeleteFlag(0);
		model.setState(0);
		
		projectService.publishPro(currUser, model);
		
		response.setContentType("text/hmtl;charset=utf-8");
		request.setAttribute("tip", "发布成功！我们的工作人员将在24小时内审核");
		
		System.out.println(model);
		return "publish";
	}

	/* 去发布 */
	public String toPublish() {
		System.out.println("----------toPublish-----------");
		List<Category> list = categoryService.getAll();
		System.out.println(list);
		request.setAttribute("cateList", list);

		return "toPublish";
	}

	@Override
	public void prepare() throws Exception {

	}

	@Override
	public Project getModel() {
		System.out.println("---------getModel-----------");
		return model;
	}

}
