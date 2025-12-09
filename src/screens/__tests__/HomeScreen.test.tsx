import React from "react";
import { render, fireEvent } from "@testing-library/react-native";
import HomeScreen from "../HomeScreen";

// Mock navigation
const mockNavigation = {
  navigate: jest.fn(),
};

describe("HomeScreen", () => {
  // Test case 1: Không crash & Render đúng (Yêu cầu Render)
  it("should render correctly without crashing", () => {
    const { getByTestId } = render(<HomeScreen navigation={mockNavigation} />);
    const textElement = getByTestId("welcome-text");
    expect(textElement).toBeTruthy();
  });

  // Test case 2: Button hiển thị đúng (Yêu cầu Render)
  it("should display the navigation button", () => {
    const { getByText } = render(<HomeScreen navigation={mockNavigation} />);
    const button = getByText("Go to Details");
    expect(button).toBeTruthy();
  });

  // Test case 3: Sự kiện bấm nút (Yêu cầu Button Press)
  it("should navigate when button is pressed", () => {
    const { getByText } = render(<HomeScreen navigation={mockNavigation} />);
    const button = getByText("Go to Details");

    fireEvent.press(button);

    // Kiểm tra hàm navigate có được gọi không
    expect(mockNavigation.navigate).toHaveBeenCalledWith("Details");
  });
});
