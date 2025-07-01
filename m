Return-Path: <linux-tegra+bounces-7609-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2A0AEEE8B
	for <lists+linux-tegra@lfdr.de>; Tue,  1 Jul 2025 08:23:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C2F83B81B8
	for <lists+linux-tegra@lfdr.de>; Tue,  1 Jul 2025 06:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 183932459FD;
	Tue,  1 Jul 2025 06:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ec0cx7zG"
X-Original-To: linux-tegra@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725C721CFF6
	for <linux-tegra@vger.kernel.org>; Tue,  1 Jul 2025 06:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751350999; cv=none; b=glzsLU/vkM6oFjLkwW4fmZqyQdkvPREYpfAa8+kwHR2pPKqnia6cVJyvjtjy9XpGtRJ2x2xvpam7B4y1pJIgNJjq8l9T5TkO+Xdtsg7i4lOVXvcDLwpjAMg5ZSp40HgB/FFQvxoHj4p340jZ6f4NIn3vqOY8+EBpwKTOxbPQB3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751350999; c=relaxed/simple;
	bh=Pkm5eBG02tWRKAdbUim2tyIzOe7R5n0k12DcqymuK0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZzBICxUFaZEMHFGzAV3xF3xIndRZZS1cZBiQpgqXqkw4BVWVCa810pXMp4r1SLKb94RQS9SENp8iv2A1s4BICjcz7W8pFvQ6DEo8dgJN2INd0nFr7wqk5iGQ9naRqnmkNa+diWl1JFdUv70bQY21PC/1yJB/x2cZ3NH7+Y9MxdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ec0cx7zG; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-235ef62066eso63627425ad.3
        for <linux-tegra@vger.kernel.org>; Mon, 30 Jun 2025 23:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751350997; x=1751955797; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rW4h4Azwa9b41U/MJ+0olhYYxjHSpz1IrlhZfFrXOVY=;
        b=ec0cx7zGbBOa23C0PtT1hQaVLmY2Yrz5uzWzNP12IcHcknoJAHsaW8sQ7LqYzMMg7p
         oDDoEIYvLinIdHiK7EZwv2FS2YE5Z4Y8a8yJAY9ggw3J1L1nK+vknPlWHQNOVZjJyIIW
         4ns/McMFbQkQ44Nyi0b1C4CgnTDZ3iOfYUaoW/P6H/RrhMUt3yZg3e2qWBPBe77GIQnV
         DR6tKIf8bCCpm37yUjjhCA/0veiX5dPYTCVxq3KvuYvIgr3onJWNKSGSABmB204x+XeK
         4KGIrGBiTj1v6eO7wf1qF1JKNN3DOimL6lWTUuz92FEZrOhw/qmWK+fz7GQZpZvxCh8U
         G7ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751350997; x=1751955797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rW4h4Azwa9b41U/MJ+0olhYYxjHSpz1IrlhZfFrXOVY=;
        b=boXZ3AmRDv5OtWTLhVB5Kkzq7JijnlkZEdVmWQM29WOLFEoOHLYJj7QoKTHfVfaqmX
         MhVBDlB7gvcQDB2yfJDmqV+EfqOv+IqrW6GClqIqQthnXVkt1tx48uIESmRchw/5E99W
         IxmyWGak+GHPDIxXOFIyE1wEnN5GJIiwkSehmzxAMrYdsCvW+cOzGcQEwIWZZ1sBSLnk
         m7265y+NEQzhIwq1vntu9OWEM15fxbyruDpf8rZzBn3Qwbuw5qNZQYkWzAtqYEo41Ews
         /uI0Csxy1KyQrNmSbRbT2SZJT617bNKD8lRuh62yOXQOen7VvZtfLiZ8S4tUdIJ5h7uw
         rHXA==
X-Forwarded-Encrypted: i=1; AJvYcCUEdDUNx+MOK/pDrPgEqMycKz95FCqMIIps5rwWWp61NM5Bcfi8i7CqbWrmapVtgWvaq6VQdpU68dSlaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxH6X1vnqehdfNBafDWbL5OJrlDgBrS7mbimv25dEFZ6inYqu6c
	XvsNoPEAZwOLXgbbpw9vBKlKpBDfj8Eu1cUxYLnQ0FTyw7FYBs83pCV4TjDZbR8i/7A=
X-Gm-Gg: ASbGncvP2T0jOhD+s7Y61R4gf/xIm/ZS0C7cs1NqWjK1esPZySfk6LrK2C0QiQqHwhl
	8UVrbYhDYG8KB1KsH+JXwEPbNtB5PdUKfX5rxfuNPaGX04hQfoXT/u8Vak7C9XcFKceXaS9b/1K
	gOx6V81i27YztrsJaDK0Y4oIoZOZ1H/j5PbeCkMPPPW8GOQ6ez5TrkDxiZDldxscQ1+FfjVy13r
	d9ndRS6ZVnpJNLTXAtyM6xk6uJEMbTSwrKOZa7OjzHEaJB5nmvQlKYeCi5bFxC8qAPPPBD1yeaV
	fi73Yrr/DlYyE9oEle0KuABNFzPrh0O7BRl121KaL4S/++PdStiiFLr2TnTFj4E=
X-Google-Smtp-Source: AGHT+IGanyq+1JfKGAQVUmGzDCF/NOtl/SVC9FC+zmGFUYpqyIfc1oMAT6U/DUOWZXgu5l+4XMVi3g==
X-Received: by 2002:a17:903:4b24:b0:234:ed31:fcb1 with SMTP id d9443c01a7336-23b330c6876mr34741925ad.20.1751350996743;
        Mon, 30 Jun 2025 23:23:16 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39bfbesm105884895ad.109.2025.06.30.23.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 23:23:16 -0700 (PDT)
Date: Tue, 1 Jul 2025 11:53:14 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 1/2] cpufreq: tegra124: Remove use of disable_cpufreq
Message-ID: <20250701062314.42hudnylecbrta4f@vireshk-i7>
References: <20250508-tegra124-cpufreq-v4-0-d142bcbd0234@gmail.com>
 <20250508-tegra124-cpufreq-v4-1-d142bcbd0234@gmail.com>
 <040b0d8b-e862-48dd-9b77-9266a5194f99@nvidia.com>
 <20250519101725.k644wzizjwygtwa7@vireshk-i7>
 <49e7d006-e9cb-49da-a4cb-b73a08f6b792@nvidia.com>
 <20250520100218.te5i5ltrx43zjsq6@vireshk-i7>
 <9826e66a-3474-4a00-967d-b7784ff60be4@nvidia.com>
 <20250605105151.5s6eblr472mbhunt@vireshk-i7>
 <CALHNRZ-uA6vHYbb5UdDvhRrNy5j2jyds4iTsiOxc6O=2nnedbg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALHNRZ-uA6vHYbb5UdDvhRrNy5j2jyds4iTsiOxc6O=2nnedbg@mail.gmail.com>

On 30-06-25, 13:43, Aaron Kling wrote:
> In my opinion, I'm thinking the original flow makes more sense. If
> resume fails, disable cpufreq. Then the subsystem doesn't keep trying
> and failing and causing who knows what kind of havoc.

Lets do this and move ahead since we aren't able to conclude for a while.

-- 
viresh

