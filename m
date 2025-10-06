Return-Path: <linux-tegra+bounces-9656-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD34BBFA6A
	for <lists+linux-tegra@lfdr.de>; Tue, 07 Oct 2025 00:14:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3CF044E585B
	for <lists+linux-tegra@lfdr.de>; Mon,  6 Oct 2025 22:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16DFF1F1311;
	Mon,  6 Oct 2025 22:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WKe8Exax"
X-Original-To: linux-tegra@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF311D432D;
	Mon,  6 Oct 2025 22:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759788854; cv=none; b=M0AhtGpcW0K1Re0Y8z/+efpO1H8/iUh2CExxcZuv47z7hKoZpnU++9Xv/CXkXAjIK5zK+FquiObDfNGG312S4g9KJohuOjca7MLg+8fuwTRfj2p+ODIxQ1g48b3VjzTHJdHBYZi6rEW2344rLCvYAkmflIisOhalKPX5TejOt8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759788854; c=relaxed/simple;
	bh=vc2zfBv+sZdgN7qYmn/qbFJ6bMd1d403JGcK7Fnxl4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=syv1s0Nj1Sv0YbQLB+lcdhinWpyrvJtTTXCvetwJdlakUUjZVST3MupqpM3uu6+y+9YR1thqWTD/KWiAa093at+grbENlrB/Wvs8bRjUlvdqh8vv5EJhB7FqPGz5GuhpCDKiZSuVqPF6FP41G+nQWZeX09E9AbBVzYs+d031m88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WKe8Exax; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4023EC4CEF5;
	Mon,  6 Oct 2025 22:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759788852;
	bh=vc2zfBv+sZdgN7qYmn/qbFJ6bMd1d403JGcK7Fnxl4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WKe8ExaxQO/iF5ThVSK09XPAoamAEtxbRuGxEaDcefSXWxUnlCmvKAgT/hGN4V3Ew
	 aPzQeVKh/8UTdz7yXyKYiT9B5RgnP5OuiiPphxw9HIU9hJ8fuhToEAyFGV+aMmYchf
	 KiWmPiqFohLNsxDeFtMxBqsdXHkDBAIv8MGSyzGXWqgDcFWCyrtkILq7x+RibMbeM9
	 JHnYp00tTyd8IJmvb/7LrBnkZX4/InerAmZAHoIZqZ+eQWWGnbC0O5pwwxw9KYDmWF
	 2VEKCfzxvTFJttsNarmtP+LbQKOka5JhB/CdZ7Qq3Br7M651zXlbEltLr5yfraWUcT
	 TprCPGuiheidA==
Date: Mon, 6 Oct 2025 17:14:11 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Douglas Anderson <dianders@chromium.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
	David Airlie <airlied@gmail.com>, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v1 4/8] dt-bindings: display: panel: document Samsung
 LTL106AL01 simple panel
Message-ID: <175978885082.673862.6679789461297588474.robh@kernel.org>
References: <20250929142455.24883-1-clamor95@gmail.com>
 <20250929142455.24883-5-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250929142455.24883-5-clamor95@gmail.com>


On Mon, 29 Sep 2025 17:24:50 +0300, Svyatoslav Ryhel wrote:
> Document Samsung LTL106AL01 simple LVDS panel.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


