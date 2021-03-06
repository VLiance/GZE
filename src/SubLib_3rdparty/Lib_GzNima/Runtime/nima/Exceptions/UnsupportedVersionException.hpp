#ifndef _NIMA_UNSUPPORTEDVERSIONEXCEPTION_HPP_
#define _NIMA_UNSUPPORTEDVERSIONEXCEPTION_HPP_

#include <exception>
#include <string>
#include "DisableException.hpp"

namespace nima
{
	class UnsupportedVersionException : public std::exception
	{
		std::string m_Message;
		int m_VersionFound;
		int m_VersionRequired;


		public:
			UnsupportedVersionException(std::string msg, int version, int versionRequired) : m_Message(msg), m_VersionFound(version), m_VersionRequired(versionRequired)
			{

			}

			const std::string message() const
			{
				return m_Message;
			}

			int versionFound() const
			{
				return m_VersionFound;
			}

			int versionRequired() const
			{
				return m_VersionRequired;
			}
	};
}
#endif