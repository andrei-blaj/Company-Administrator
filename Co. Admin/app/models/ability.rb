class Ability
  include CanCan::Ability

  def initialize(user)

    if user.paid?

        if user.ceo?
            
            @number_of_projects = CompanyPlan.find_by(id: user.company_plan_id).max_num_of_projects

            can :create, Contribution

            can :update, Contribution do |contribution|
                contribution.user_id == user.id
            end

            can :destroy, Contribution do |contribution|
                contribution.user_id == user.id
            end

            can :read, DailyTask do |daily_task|
                user.company_name == Project.find_by(id: daily_task.project_id).company_name
            end

            can :update, DailyTask do |daily_task|
                user.email == Project.find_by(id: daily_task.project_id).manager_email
            end

            can :create, Project do |proj|
                Project.count < @number_of_projects
            end

            can :create, DailyTask

            can :read, Project do |proj|
                proj.company_name == user.company_name
            end

            can :read, User do |u|
                user.company_name == u.company_name
            end

            can :destroy, Project do |proj|
                proj.company_name == user.company_name
            end
            
            can :update, Project do |proj|
                proj.company_name == user.company_name
            end

            can :destroy, User do |u|
                user.company_name == u.company_name
            end

        else

            if user.man?

                can :create, Contribution

                can :update, Contribution do |contribution|
                    contribution.user_id == user.id
                end

                can :destroy, Contribution do |contribution|
                    contribution.user_id == user.id
                end

                can :read, DailyTask do |daily_task|
                    user.company_name == Project.find_by(id: daily_task.project_id).company_name
                end

                can :update, DailyTask do |daily_task|
                    user.company_name == Project.find_by(id: daily_task.project_id).company_name
                end

                can :read, Project do |proj|
                    proj.company_name == user.company_name
                end

                can :destroy, User do |u|
                    user.work_relations.each do |relation|
                        u == User.find_by(id: relation.subordinate_id)
                    end
                end

            elsif user.emp?

                can :create, Contribution

                can :update, Contribution do |contribution|
                    contribution.user_id == user.id
                end

                can :destroy, Contribution do |contribution|
                    contribution.user_id == user.id
                end

                can :read, Project do |proj|
                    proj.company_name == user.company_name
                end

                can :read, DailyTask do |daily_task|
                    user.company_name == Project.find_by(id: daily_task.project_id).company_name
                end

            end
            
        end

    end

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
