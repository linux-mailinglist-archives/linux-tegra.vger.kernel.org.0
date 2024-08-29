Return-Path: <linux-tegra+bounces-3534-lists+linux-tegra=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFA296407D
	for <lists+linux-tegra@lfdr.de>; Thu, 29 Aug 2024 11:46:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95FC51F22FC7
	for <lists+linux-tegra@lfdr.de>; Thu, 29 Aug 2024 09:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7A8318DF67;
	Thu, 29 Aug 2024 09:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UmgVhiUn"
X-Original-To: linux-tegra@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5B516D300;
	Thu, 29 Aug 2024 09:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724924780; cv=none; b=VBK9pnlRrv4JZZIb3G+Y088HQEu+7uxONGbYgzKf4XOwzeHcCeIFhRUWWIS3+Dq1wpiTAY+xBypynWNbjBGmso1aQza1IU/bpWLYWQ5xRT6JHWuK5bETFp6o08f5defeOJFgRKkgxylaGBzalT0Zu2HsuWc5+/r8fbOvvk43eIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724924780; c=relaxed/simple;
	bh=ocJ8W/+M0Xz6OUD7zGhNMsK/xqBmqnD22uG+2O4i6zY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nGXZstaQm7uUZKZqfcm0AVhqv8EiprzU44ksSVKd2Z7nkOFCwGDikq2HHFtHvQDjmGRsOdPEXj++iNoCa7DsVnlgdTLKI/Yrti5bdqQM97AQCYTXsmJxo2kski5FYqNyiTDW+E5tTmqWL9NR96060Ugdv+lbo6YjaRY4NND8t8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UmgVhiUn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5CD3D6AF;
	Thu, 29 Aug 2024 11:45:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724924708;
	bh=ocJ8W/+M0Xz6OUD7zGhNMsK/xqBmqnD22uG+2O4i6zY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UmgVhiUnCSV2IzZHzRmXGnHfFK7bDFSnfuuOjoMteR7bPl/Msml6Ppb/PPfzlEBO7
	 X3Z1uURAsbZ0Ep70kPPT4OEfDzIQAX8CsuYHNXxvTR3xubUCWDuJbyv5fux2oB6Asa
	 ZuuGaKIN1wBu8rqJVAXHeZX2BenWnle8bo/lW3ow=
Date: Thu, 29 Aug 2024 12:45:46 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Liao Chen <liaochen4@huawei.com>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>,
	"jonathanh@nvidia.com" <jonathanh@nvidia.com>,
	"jacopo@jmondi.org" <jacopo@jmondi.org>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH -next 1/3] media: v4l2-subdev: enable module autoloading
Message-ID: <20240829094546.GA12951@pendragon.ideasonboard.com>
References: <20240829075417.526459-1-liaochen4@huawei.com>
 <20240829075417.526459-2-liaochen4@huawei.com>
 <TY3PR01MB11346459841445E77A5FBA37B86962@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346459841445E77A5FBA37B86962@TY3PR01MB11346.jpnprd01.prod.outlook.com>

On Thu, Aug 29, 2024 at 08:27:06AM +0000, Biju Das wrote:
> Hi Liao Chen,
> On Thursday, August 29, 2024 8:54 AM, Liao Chen wrote:
> > Subject: [PATCH -next 1/3] media: v4l2-subdev: enable module autoloading
> 
> Commit header is wrong.

Indeed, it should be

media: i2c: mt9v111: Enable module autoloading

> > Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded based on the alias from
> > of_device_id table.

Please also reflow the commit message to 72 columns. With those issues
fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> > 
> > Signed-off-by: Liao Chen <liaochen4@huawei.com>
> > ---
> >  drivers/media/i2c/mt9v111.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/media/i2c/mt9v111.c b/drivers/media/i2c/mt9v111.c index
> > b0b98ed3c150..b6a2623798c5 100644
> > --- a/drivers/media/i2c/mt9v111.c
> > +++ b/drivers/media/i2c/mt9v111.c
> > @@ -1265,6 +1265,7 @@ static const struct of_device_id mt9v111_of_match[] = {
> >  	{ .compatible = "aptina,mt9v111", },
> >  	{ /* sentinel */ },
> 
> Nit: Comma can be dropped from terminator entry as a separate patch.
> 
> Cheers,
> Biju
> 
> >  };
> > +MODULE_DEVICE_TABLE(of, mt9v111_of_match);
> > 
> >  static struct i2c_driver mt9v111_driver = {
> >  	.driver = {

-- 
Regards,

Laurent Pinchart

