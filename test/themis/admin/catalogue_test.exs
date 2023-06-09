defmodule Themis.Admin.CatalogueTest do
  use Themis.DataCase

  alias Themis.Admin.Catalogue

  describe "titles" do
    alias Themis.Admin.Catalogue.Title

    import Themis.Admin.CatalogueFixtures

    @invalid_attrs %{is_one_shot: nil, name: nil, start_year: nil}

    test "list_titles/0 returns all titles" do
      title = title_fixture()
      assert Catalogue.list_titles() == [title]
    end

    test "get_title!/1 returns the title with given id" do
      title = title_fixture()
      assert Catalogue.get_title!(title.id) == title
    end

    test "create_title/1 with valid data creates a title" do
      valid_attrs = %{is_one_shot: true, name: "some name", start_year: 42}

      assert {:ok, %Title{} = title} = Catalogue.create_title(valid_attrs)
      assert title.is_one_shot == true
      assert title.name == "some name"
      assert title.start_year == 42
    end

    test "create_title/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalogue.create_title(@invalid_attrs)
    end

    test "update_title/2 with valid data updates the title" do
      title = title_fixture()
      update_attrs = %{is_one_shot: false, name: "some updated name", start_year: 43}

      assert {:ok, %Title{} = title} = Catalogue.update_title(title, update_attrs)
      assert title.is_one_shot == false
      assert title.name == "some updated name"
      assert title.start_year == 43
    end

    test "update_title/2 with invalid data returns error changeset" do
      title = title_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalogue.update_title(title, @invalid_attrs)
      assert title == Catalogue.get_title!(title.id)
    end

    test "delete_title/1 deletes the title" do
      title = title_fixture()
      assert {:ok, %Title{}} = Catalogue.delete_title(title)
      assert_raise Ecto.NoResultsError, fn -> Catalogue.get_title!(title.id) end
    end

    test "change_title/1 returns a title changeset" do
      title = title_fixture()
      assert %Ecto.Changeset{} = Catalogue.change_title(title)
    end
  end

  describe "issues" do
    alias Themis.Admin.Catalogue.Issue

    import Themis.Admin.CatalogueFixtures

    @invalid_attrs %{cover_date: nil, is_annual: nil, name: nil, number: nil}

    test "list_issues/0 returns all issues" do
      issue = issue_fixture()
      assert Catalogue.list_issues() == [issue]
    end

    test "get_issue!/1 returns the issue with given id" do
      issue = issue_fixture()
      assert Catalogue.get_issue!(issue.id) == issue
    end

    test "create_issue/1 with valid data creates a issue" do
      valid_attrs = %{cover_date: "some cover_date", is_annual: true, name: "some name", number: 42}

      assert {:ok, %Issue{} = issue} = Catalogue.create_issue(valid_attrs)
      assert issue.cover_date == "some cover_date"
      assert issue.is_annual == true
      assert issue.name == "some name"
      assert issue.number == 42
    end

    test "create_issue/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalogue.create_issue(@invalid_attrs)
    end

    test "update_issue/2 with valid data updates the issue" do
      issue = issue_fixture()
      update_attrs = %{cover_date: "some updated cover_date", is_annual: false, name: "some updated name", number: 43}

      assert {:ok, %Issue{} = issue} = Catalogue.update_issue(issue, update_attrs)
      assert issue.cover_date == "some updated cover_date"
      assert issue.is_annual == false
      assert issue.name == "some updated name"
      assert issue.number == 43
    end

    test "update_issue/2 with invalid data returns error changeset" do
      issue = issue_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalogue.update_issue(issue, @invalid_attrs)
      assert issue == Catalogue.get_issue!(issue.id)
    end

    test "delete_issue/1 deletes the issue" do
      issue = issue_fixture()
      assert {:ok, %Issue{}} = Catalogue.delete_issue(issue)
      assert_raise Ecto.NoResultsError, fn -> Catalogue.get_issue!(issue.id) end
    end

    test "change_issue/1 returns a issue changeset" do
      issue = issue_fixture()
      assert %Ecto.Changeset{} = Catalogue.change_issue(issue)
    end
  end
end
